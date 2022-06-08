----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.03.2022 20:52:26
-- Design Name: 
-- Module Name: alu_tb - Behavioral
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



-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu_tb is
end alu_tb;

architecture Behavioral of alu_tb is

signal clk  : std_logic := '0';
signal ctrl_in : std_logic_vector(2 downto 0) := "000";
signal Ain : std_logic_vector(3 downto 0) := "0000";
signal Bin : std_logic_vector(3 downto 0) := "0000";
signal output : std_logic_vector(7 downto 0):= "00000000";

component control is
port (A, B : in STD_LOGIC_VECTOR (3 downto 0);
        ctrl_in : in STD_LOGIC_VECTOR (2 downto 0);
         clk : in STD_LOGIC;
          output : out STD_LOGIC_VECTOR (7 downto 0));
end component;

begin
clk <= not clk after 1.35 ns;

dut: control 
port map (
A => Ain,
B => Bin,
ctrl_in => ctrl_in,
clk => clk,
output => output);

stimulus:
process begin
ctrl_in <= "000"; Ain<="0111";Bin<="1000";
 wait for 4.05 ns;
ctrl_in <= "010"; Ain<="0101";Bin<="1011";
 wait for 1.1 ns;
ctrl_in <= "100"; Ain<="0110";Bin<="1001";
 wait for 2.7 ns;
ctrl_in <= "001"; Ain<="1101";Bin<="0011";
 wait for 2.7 ns;
ctrl_in <= "011"; Ain<="0111";Bin<="1101";
 wait for 2.7 ns;
 ctrl_in <= "000"; Ain<="0001";Bin<="1001";
 wait for 2.7 ns;
 ctrl_in <= "101"; Ain<="1101";Bin<="0001";
 wait for 2.7 ns;
 ctrl_in <= "111"; Ain<="0111";Bin<="1101";
 wait for 2.7 ns;
 ctrl_in <= "110"; Ain<="0111";Bin<="0001";
 wait;
end process stimulus;

end Behavioral;
