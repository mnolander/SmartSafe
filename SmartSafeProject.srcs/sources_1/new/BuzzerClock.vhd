library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity BuzzerClock is
    Port (
        clk    : in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        clk_out: out STD_LOGIC
    );
end BuzzerClock;
 
architecture Behavioral of BuzzerClock is
    signal temporal: STD_LOGIC;
    signal counter : integer range 0 to 5000000 := 0;
begin
    freq_divider: process (reset, clk) begin
        if (reset = '1') then
            temporal <= '0';
            counter  <= 0;
        elsif (clk='1' and clk'event) then
            if (counter = 5000000) then
                temporal <= NOT(temporal);
                counter  <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
 
    clk_out <= temporal;
end Behavioral;