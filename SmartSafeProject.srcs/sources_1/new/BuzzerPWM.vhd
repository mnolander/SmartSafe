library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BuzzerPWM is
    PORT (
        clk   : IN  STD_LOGIC;
        reset : IN  STD_LOGIC;
        buzzIn   : IN  STD_LOGIC;
        buzzOut : OUT STD_LOGIC
    );
end BuzzerPWM;

architecture Behavioral of BuzzerPWM is
    -- Counter, from 0 to 1279.
    signal cnt : unsigned(10 downto 0);
    -- Temporal signal used to generate the PWM pulse.
    signal pwmi: unsigned(7 downto 0);
begin
    -- Minimum value should be 0.5ms.
    pwmi <= unsigned('0' & buzzIn) + 32;
    -- Counter process, from 0 to 1279.
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
    -- Output signal for the servomotor.
    buzzOut <= '1' when (cnt < pwmi) else '0';
end Behavioral;