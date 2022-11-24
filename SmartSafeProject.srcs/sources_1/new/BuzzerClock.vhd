library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity BuzzerClock is
Port (CLK: in STD_LOGIC; buzzerClk: out STD_LOGIC);
end BuzzerClock;

architecture Behavioral of BuzzerClock is
begin

process(CLK)
variable count: integer := 0;
begin
    if(CLK'EVENT AND CLK = '1') then
        if count <= 100000 then
            count := count + 1;
            buzzerClk <= '1';
        elsif count > 100000 AND count < 200000 then
            count := count + 1;
            buzzerClk <= '0';
        elsif count = 200000 then
            count := 0;  
        end if;
    end if;
end process;
end Behavioral; 