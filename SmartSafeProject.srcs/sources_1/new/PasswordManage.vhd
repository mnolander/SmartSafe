library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
entity PasswordManage is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC; -- reset
           PasswordDisplay : in  STD_LOGIC_VECTOR (15 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);-- 4 Anode signals
           LED_out : out STD_LOGIC_VECTOR (6 downto 0));-- Cathode patterns of 7-segment display
end PasswordManage;

architecture Behavioral of PasswordManage is
type statesList is (set, locked, unlocked);
signal state: statesList;
begin



end Behavioral;
