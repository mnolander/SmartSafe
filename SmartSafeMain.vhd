library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.Common.all;

entity SmartSafe is
    Port ( 
        clk: in  STD_LOGIC;
        reset: in STD_LOGIC;
        passwordButton: in STD_LOGIC; -- Button for setting/changing password
		unlockButton: in STD_LOGIC; -- Button for unlocking safe
		lockButton: in STD_LOGIC; -- Button for locking safe
        selectDigit: in STD_LOGIC_VECTOR(3 downto 0); -- To select digit of password on seven segment
		JA: inout  STD_LOGIC_VECTOR (7 downto 0); -- PmodKYPD is designed to be connected to JA
		an: out  STD_LOGIC_VECTOR (3 downto 0);   -- Controls which position of the seven segment display to display
		seg: out  STD_LOGIC_VECTOR (6 downto 0); -- Digit to display on the seven segment display 
		buzzer: out STD_LOGIC; -- Buzzer for audible warnings
		servoOut: out STD_LOGIC; -- Output for servo for door
		greenLED: out STD_LOGIC); -- Green LED for success
end SmartSafe;

architecture Behavioral of SmartSafe is
component Decoder is
	Port (
        clk: in  STD_LOGIC;
        Row: in  STD_LOGIC_VECTOR (3 downto 0);
        globalState: globalStateList;
        selectDigit: in STD_LOGIC_VECTOR(3 downto 0);
        lockButton: in STD_LOGIC;
        Col: out  STD_LOGIC_VECTOR (3 downto 0);
        DecodeOut: out  STD_LOGIC_VECTOR (15 downto 0));
end component;
	
component SevenSeg is
	Port ( 
        clk: in STD_LOGIC;
        reset: in STD_LOGIC; 
        PasswordDisplay: in  STD_LOGIC_VECTOR (15 downto 0);
        an: out STD_LOGIC_VECTOR (3 downto 0);
        LED_out: out STD_LOGIC_VECTOR (6 downto 0));
end component;

component ServoClock is
    Port (
        clk    : in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        clk_out: out STD_LOGIC
    );
end component;

component ServoPWM is
    Port (
        clk   : IN  STD_LOGIC;
        reset : IN  STD_LOGIC;
        pos   : IN  STD_LOGIC_VECTOR(6 downto 0);
        servo : OUT STD_LOGIC
    );
end component;

component BuzzerClock is
    Port (
        clk    : in  STD_LOGIC;
        buzzerClk: out STD_LOGIC
    );
end component;

signal globalState: globalStateList;
signal Decode, safePassword: STD_LOGIC_VECTOR (15 downto 0);
signal servoClk_out, buzzerClk_out, buzzerBool: STD_LOGIC := '0';
signal servoPos: STD_LOGIC_VECTOR(6 downto 0);
begin
	DecodeDigits: Decoder port map (clk=>clk, Row=>JA(7 downto 4), globalState=>globalState, selectDigit=>selectDigit, lockButton=>lockButton, Col=>JA(3 downto 0), DecodeOut=>Decode(15 downto 0));
	PasswordOutput: SevenSeg port map (clk=>clk,  reset=>reset, PasswordDisplay=>Decode, an=>an, LED_out=>seg);
	ServoCLK: ServoClock port map (clk=>clk, reset=>reset, clk_out=>ServoClk_out);
	ServoFreq: ServoPWM port map (clk=>ServoClk_out, reset=>reset, pos=>servoPos, servo=>servoOut);
	BuzzerCLK: BuzzerClock port map (clk=>clk, buzzerClk=>buzzerClk_out);
	
	process(CLK, globalState, buzzerBool)
	begin
	buzzerBool <= '0';
        if(CLK='1' and CLK'event) then
            case globalState is
                when set =>                    
                    if(passwordButton = '1' AND selectDigit = "0000") then
                        safePassword <= Decode;
                        greenLED<='1';
                    elsif(passwordButton = '1' AND selectDigit /= "0000") then
                        buzzerBool <= '1';
                    elsif(lockButton = '1') then
                        globalState <= locked;
                        servoPos <= "1111111";
                    elsif(unlockButton = '1') then
                        NULL;
                    end if;
                when unlocked =>
                	greenLED <= '0';                            
	                if(passwordButton = '1') then
	                   globalState <= set;
	                elsif(lockButton = '1') then
	                   globalState <= locked;
	                   servoPos <= "1111111";
	                elsif(unlockButton = '1') then
	                   NULL;
	                end if;
                when locked =>         
                    greenLED <= '0';             
                    if(unlockButton = '1') then
                        if(Decode = safePassword) then
                            globalState <= unlocked;
                            servoPos <= "0000000";
                        elsif(Decode /= safePassword) then
                            buzzerBool <= '1';
                        end if;
                    elsif(passwordButton = '1') then
                        buzzerBool <= '1';
                    elsif(lockButton = '1') then
                        NULL;
                    end if;
            end case;  
        end if; 
	end process;
	
	process(buzzerClk_out, buzzerBool) -- Activate/deactivate buzzer
	begin
	   if(buzzerClk_out = '1' AND buzzerBool = '1') then
	       buzzer <= '1';
	   else
	       buzzer <= '0';
	   end if;
    end process;
end Behavioral;