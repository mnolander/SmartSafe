--Adapted from https://www.codeproject.com/Articles/513169/Servomotor-Control-with-PWM-and-VHDL

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ServoPWM is
    PORT (
        clk   : IN  STD_LOGIC;
        reset : IN  STD_LOGIC;
        pos   : IN  STD_LOGIC_VECTOR(6 downto 0);
        servo : OUT STD_LOGIC
    );
end ServoPWM;

architecture Behavioral of ServoPWM is
    signal cnt : unsigned(10 downto 0);
    signal pwmi: unsigned(7 downto 0);
begin
    pwmi <= unsigned('0' & pos) + 32;
    counter: process (reset, clk) begin
        if (reset = '1') then
            cnt <= (others => '0');
        elsif (clk='1' and clk'event) then
            if (cnt = 1279) then
                cnt <= (others => '0');
            else
                cnt <= cnt + 1;
            end if;
        end if;
    end process;
    servo <= '1' when (cnt < pwmi) else '0';
end Behavioral;