--Adapted from https://www.codeproject.com/Articles/513169/Servomotor-Control-with-PWM-and-VHDL

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity ServoClock is
    Port (
        clk    : in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        clk_out: out STD_LOGIC
    );
end ServoClock;
 
architecture Behavioral of ServoClock is
    signal tmp: STD_LOGIC;
    signal count : integer range 0 to 780 := 0;
begin
    freq_divider: process (reset, clk) begin
        if (reset = '1') then
            tmp <= '0';
            count  <= 0;
        elsif (clk='1' AND clk'EVENT) then
            if (count = 780) then
                tmp <= NOT(tmp);
                count  <= 0;
            else
                count <= count + 1;
            end if;
        end if;
    end process;
    clk_out <= tmp;
end Behavioral;