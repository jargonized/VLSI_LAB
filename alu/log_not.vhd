----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.03.2022 22:48:10
-- Design Name: 
-- Module Name: log_not - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity log_not is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0);
           cs : in STD_LOGIC);
end log_not;

architecture Behavioral of log_not is

begin
process (cs)
begin
if (cs = '1') then 
res <= "0000"&(not A);
end if;
end process;


end Behavioral;
