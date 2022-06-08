----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.03.2022 22:48:10
-- Design Name: 
-- Module Name: shift - Behavioral
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

entity shift is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC;
           cs : in STD_LOGIC;
           res : out STD_LOGIC_VECTOR (7 downto 0));
end shift;

architecture Behavioral of shift is

begin
process (cs)
begin
if (cs = '1') then
if (sel = '1') then
res <= "0000"&(std_logic_vector(shift_left(unsigned(A),1)));
elsif (sel = '0') then
 res <=  "0000"&(std_logic_vector(shift_right(unsigned(A),1)));
 end if;
end if;
end process;

end Behavioral;
