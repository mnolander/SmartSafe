library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.Common.all;

entity Decoder is
    Port (
        clk: in  STD_LOGIC;
        Row: in  STD_LOGIC_VECTOR (3 downto 0);
        globalState: globalStateList;
        selectDigit: in STD_LOGIC_VECTOR(3 downto 0);
        lockButton: in STD_LOGIC;
        Col: out  STD_LOGIC_VECTOR (3 downto 0);
        DecodeOut: out  STD_LOGIC_VECTOR (15 downto 0));
end Decoder;

architecture Behavioral of Decoder is
signal sclk: STD_LOGIC_VECTOR(19 downto 0);
signal digit1, digit2, digit3, digit4: STD_LOGIC_VECTOR(3 downto 0);
type statesList is (dgt1, dgt2, dgt3, dgt4, full);
signal state: statesList;
begin
process(CLK, selectDigit, state)
    begin
    if(CLK='1' and CLK'event) then
        case selectDigit is
            when "0000" =>
                state <= full;
            when "0001" =>
                state <= dgt1;
            when "0010" =>
                state <= dgt2;
            when "0100" =>
                state <= dgt3;
            when "1000" =>
                state <= dgt4;
            when others => NULL;
         end case;
    end if;
end process;

process(clk)
	begin 
		if(CLK='1' and CLK'event) then
		    if (globalState = locked AND lockButton = '1') then --Reset display when locking safe
                digit1 <= "0000";    
                digit2 <= "0000";    
                digit3 <= "0000";    
                digit4 <= "0000";
            end if;
			-- 1ms
			if sclk = "00011000011010100000" then 
				--C1
				Col<= "0111";
				sclk <= sclk+1;
			-- check row pins
			elsif sclk = "00011000011010101000" then	
				--R1
				if Row = "0111" then
				    case state is
				        when dgt1 =>
				            digit1 <= "0001";	--1
				        when dgt2 =>
				            digit2 <= "0001";
				        when dgt3 =>
				            digit3 <= "0001";
				        when dgt4 =>
				            digit4 <= "0001";
				        when full =>
				            NULL;
                    end case;
				--R2
				elsif Row = "1011" then
				    case state is
				        when dgt1 =>
				            digit1 <= "0100";	--4
				        when dgt2 =>
				            digit2 <= "0100";
				        when dgt3 =>
				            digit3 <= "0100";
				        when dgt4 =>
				            digit4 <= "0100";
				        when full =>
				            NULL;
                    end case;
				--R3
				elsif Row = "1101" then
				    case state is
				        when dgt1 =>
				            digit1 <= "0111";	--7
				        when dgt2 =>
				            digit2 <= "0111";
				        when dgt3 =>
				            digit3 <= "0111";
				        when dgt4 =>
				            digit4 <= "0111";
				        when full =>
				            NULL;
                    end case;
				--R4
				elsif Row = "1110" then
				    case state is
				        when dgt1 =>
				            digit1 <= "0000";	--0
				        when dgt2 =>
				            digit2 <= "0000";
				        when dgt3 =>
				            digit3 <= "0000";
				        when dgt4 =>
				            digit4 <= "0000";
				        when full =>
				            NULL;
                    end case;
				end if;
				sclk <= sclk+1;
			-- 2ms
			elsif sclk = "00110000110101000000" then	
				--C2
				Col<= "1011";
				sclk <= sclk+1;
			-- check row pins
			elsif sclk = "00110000110101001000" then	
				--R1
				if Row = "0111" then		
				    case state is
				        when dgt1 =>
				            digit1 <= "0010";	--2
				        when dgt2 =>
				            digit2 <= "0010";
				        when dgt3 =>
				            digit3 <= "0010";
				        when dgt4 =>
				            digit4 <= "0010";
				        when full =>
				            NULL;
                    end case;
				--R2
				elsif Row = "1011" then
				    case state is
				        when dgt1 =>
				            digit1 <= "0101";	--5
				        when dgt2 =>
				            digit2 <= "0101";
				        when dgt3 =>
				            digit3 <= "0101";
				        when dgt4 =>
				            digit4 <= "0101";
				        when full =>
				            NULL;
                    end case;
				--R3
				elsif Row = "1101" then
				    case state is
				        when dgt1 =>
				            digit1 <= "1000";	--8
				        when dgt2 =>
				            digit2 <= "1000";
				        when dgt3 =>
				            digit3 <= "1000";
				        when dgt4 =>
				            digit4 <= "1000";
				        when full =>
				            NULL;
                    end case;
				--R4
				elsif Row = "1110" then
				    case state is
				        when dgt1 =>
				            digit1 <= "1111";	--F
				        when dgt2 =>
				            digit2 <= "1111";
				        when dgt3 =>
				            digit3 <= "1111";
				        when dgt4 =>
				            digit4 <= "1111";
				        when full =>
				            NULL;
                    end case;
				end if;
				sclk <= sclk+1;	
			--3ms
			elsif sclk = "01001001001111100000" then 
				--C3
				Col<= "1101";
				sclk <= sclk+1;
			-- check row pins
			elsif sclk = "01001001001111101000" then 
				--R1
				if Row = "0111" then
				    case state is
				        when dgt1 =>
				            digit1 <= "0011";	--3
				        when dgt2 =>
				            digit2 <= "0011";
				        when dgt3 =>
				            digit3 <= "0011";
				        when dgt4 =>
				            digit4 <= "0011";
				        when full =>
				            NULL;
                    end case;
				--R2
				elsif Row = "1011" then
				    case state is
				        when dgt1 =>
				            digit1 <= "0110";	--6
				        when dgt2 =>
				            digit2 <= "0110";
				        when dgt3 =>
				            digit3 <= "0110";
				        when dgt4 =>
				            digit4 <= "0110";
				        when full =>
				            NULL;
                    end case;
				--R3
				elsif Row = "1101" then
				    case state is
				        when dgt1 =>
				            digit1 <= "1001";	--9
				        when dgt2 =>
				            digit2 <= "1001";
				        when dgt3 =>
				            digit3 <= "1001";
				        when dgt4 =>
				            digit4 <= "1001";
				        when full =>
				            NULL;
                    end case;
				--R4
				elsif Row = "1110" then
				    case state is
				        when dgt1 =>
				            digit1 <= "1110";	--E
				        when dgt2 =>
				            digit2 <= "1110";
				        when dgt3 =>
				            digit3 <= "1110";
				        when dgt4 =>
				            digit4 <= "1110";
				        when full =>
				            NULL;
                    end case;
				end if;
				sclk <= sclk+1;
			--4ms
			elsif sclk = "01100001101010000000" then 			
				--C4
				Col<= "1110";
				sclk <= sclk+1;
			-- check row pins
			elsif sclk = "01100001101010001000" then 
				--R1
				if Row = "0111" then
				    case state is
				        when dgt1 =>
				            digit1 <= "1010";	--A
				        when dgt2 =>
				            digit2 <= "1010";
				        when dgt3 =>
				            digit3 <= "1010";
				        when dgt4 =>
				            digit4 <= "1010";
				        when full =>
				            NULL;
                    end case;
				--R2
				elsif Row = "1011" then
				    case state is
				        when dgt1 =>
				            digit1 <= "1011";	--B
				        when dgt2 =>
				            digit2 <= "1011";
				        when dgt3 =>
				            digit3 <= "1011";
				        when dgt4 =>
				            digit4 <= "1011";
				        when full =>
				            NULL;
                    end case;
				--R3
				elsif Row = "1101" then
				    case state is
				        when dgt1 =>
				            digit1 <= "1100";	--C
				        when dgt2 =>
				            digit2 <= "1100";
				        when dgt3 =>
				            digit3 <= "1100";
				        when dgt4 =>
				            digit4 <= "1100";
				        when full =>
				            NULL;
                    end case;
				--R4
				elsif Row = "1110" then
				    case state is
				        when dgt1 =>
				            digit1 <= "1101";	--D
				        when dgt2 =>
				            digit2 <= "1101";
				        when dgt3 =>
				            digit3 <= "1101";
				        when dgt4 =>
				            digit4 <= "1101";
				        when full =>
				            NULL;
                    end case;
				end if;
				sclk <= "00000000000000000000";	
			else
				sclk <= sclk+1;	
			end if;
		end if;
end process;

process
begin
    wait on digit1;
    DecodeOut <= "0000"&"0000"&"0000"&digit1;
    wait on digit2;
    DecodeOut <= "0000"&"0000"&digit2&digit1;
    wait on digit3;
    DecodeOut <= "0000"&digit3&digit2&digit1;
    wait on digit4;
    DecodeOut <= digit4&digit3&digit2&digit1;
end process;

end Behavioral;

