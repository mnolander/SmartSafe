library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
entity SevenSeg is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           PasswordDisplay : in  STD_LOGIC_VECTOR (15 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           LED_out : out STD_LOGIC_VECTOR (6 downto 0));
end SevenSeg;

architecture Behavioral of SevenSeg is
signal LED_BCD: STD_LOGIC_VECTOR (3 downto 0);
signal refresh_counter: STD_LOGIC_VECTOR (19 downto 0);
signal LED_activating_counter: std_logic_vector(1 downto 0);
begin
process(LED_BCD)
begin
    case LED_BCD is
    when "0000" => LED_out <= "0000001"; -- "0"     
    when "0001" => LED_out <= "1001111"; -- "1" 
    when "0010" => LED_out <= "0010010"; -- "2" 
    when "0011" => LED_out <= "0000110"; -- "3" 
    when "0100" => LED_out <= "1001100"; -- "4" 
    when "0101" => LED_out <= "0100100"; -- "5" 
    when "0110" => LED_out <= "0100000"; -- "6" 
    when "0111" => LED_out <= "0001111"; -- "7" 
    when "1000" => LED_out <= "0000000"; -- "8"     
    when "1001" => LED_out <= "0000100"; -- "9" 
    when "1010" => LED_out <= "0001000"; -- A

    when "1011" => LED_out <= "1100000"; -- b
    when "1100" => LED_out <= "0110001"; -- C
    when "1101" => LED_out <= "1000010"; -- d
    when "1110" => LED_out <= "0110000"; -- E
    when "1111" => LED_out <= "0111000"; -- F
    
    when others => NULL;
    end case;
end process;
process(clk,reset)
begin 
    if(reset='1') then
        refresh_counter <= (others => '0');
    elsif(rising_edge(clk)) then
        refresh_counter <= refresh_counter + 1;
    end if;
end process;
 LED_activating_counter <= refresh_counter(19 downto 18);
process(LED_activating_counter, PasswordDisplay)
begin
    case LED_activating_counter is
    when "00" =>
        an <= "0111"; 
        LED_BCD <= PasswordDisplay(15 downto 12);
    when "01" =>
        an <= "1011"; 
        LED_BCD <= PasswordDisplay(11 downto 8);
    when "10" =>
        an <= "1101"; 
        LED_BCD <= PasswordDisplay(7 downto 4);
    when "11" =>
        an <= "1110"; 
        LED_BCD <= PasswordDisplay(3 downto 0); 
    when others => NULL;  
    end case;
end process;
end Behavioral;
