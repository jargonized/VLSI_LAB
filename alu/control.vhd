----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.03.2022 22:48:10
-- Design Name: 
-- Module Name: control - Behavioral
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

entity control is
port (ctrl_in : in STD_LOGIC_VECTOR (2 downto 0);
      clk_in : in STD_LOGIC;
      output : out STD_LOGIC_VECTOR (7 downto 0);
      A : in STD_LOGIC_VECTOR (3 downto 0);
      B : in STD_LOGIC_VECTOR (3 downto 0));
end control;


architecture behavioral of control is

component clk_wiz_0 is
   port ( clk_in1 : in STD_LOGIC;
        clk_out1 : out STD_LOGIC);
  end component;


component adder is 
 port (A, B : in STD_LOGIC_VECTOR (3 downto 0);
        cs : in STD_LOGIC;
          res : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component sub is
port (A, B : in STD_LOGIC_VECTOR (3 downto 0);
        cs : in STD_LOGIC;
          res : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component mult is
port (A, B : in STD_LOGIC_VECTOR (3 downto 0);
        cs : in STD_LOGIC;
          res : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component shift is
port (A : in STD_LOGIC_VECTOR (3 downto 0);
        cs : in STD_LOGIC;
        sel : in STD_LOGIC;
          res : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component log_nand is
port (A, B : in STD_LOGIC_VECTOR (3 downto 0);
        cs : in STD_LOGIC;
          res : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component log_nor is
port (A, B : in STD_LOGIC_VECTOR (3 downto 0);
        cs : in STD_LOGIC;
          res : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component log_xor is
port (A, B : in STD_LOGIC_VECTOR (3 downto 0);
        cs : in STD_LOGIC;
          res : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component log_not is
port (A: in STD_LOGIC_VECTOR (3 downto 0);
        cs : in STD_LOGIC;
          res : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal Ain, Bin: std_logic_vector (3 downto 0) := "0000";
signal mul,sum, diff, nag, nrg, xrg, ng, sft  : std_logic_vector(7 downto 0);
signal ctrl_out : std_logic_vector (7 downto 0);
signal clk : std_logic;

begin

a1: adder port map(A => Ain, B =>Bin, cs => ctrl_out(0), res => sum);
b1: sub port map(A => Ain, B =>Bin, cs => ctrl_out(1), res => diff);
c1: mult port map(A => Ain, B =>Bin, cs => ctrl_out(2), res => mul);
e1: shift port map(A => Ain, sel =>Bin(0), cs => ctrl_out(3), res => sft);
f1: log_nand port map(A => Ain, B =>Bin, cs => ctrl_out(4), res => nag);
g1: log_nor port map(A => Ain, B =>Bin, cs => ctrl_out(5), res => nrg);
h1: log_xor port map(A => Ain, B =>Bin, cs => ctrl_out(6), res => xrg);
i1: log_not port map(A => Ain, cs => ctrl_out(7), res => ng);
pll_clk: clk_wiz_0 port map(clk_in1 => clk_in, clk_out1 => clk);

process(clk)

begin

ctrl_out <= "00000000";
case ctrl_in is
    when "000" => ctrl_out(0)<= '1';
    when "001" => ctrl_out(1)<= '1';
    when "010" => ctrl_out(2)<= '1';
    when "011" => ctrl_out(3)<= '1';
    when "100" => ctrl_out(4)<= '1';
    when "101" => ctrl_out(5)<= '1';
    when "110" => ctrl_out(6)<= '1';
    when "111" => ctrl_out(7)<= '1';
    when others => ctrl_out <= "00000000";
 end case;

if rising_edge(clk) then
Ain <= A;
Bin <= B;
end if;

output<="00000000";

if falling_edge(clk) then
case ctrl_in is
    when "000" => output(7 downto 0) <= sum;
    when "001" => output(7 downto 0) <= diff;
    when "010" => output(7 downto 0) <= mul;
    when "011" => output(7 downto 0) <= sft;
    when "100" => output(7 downto 0) <= nag;
    when "101" => output(7 downto 0) <= nrg;
    when "110" => output(7 downto 0) <= xrg;
    when "111" => output(7 downto 0) <= ng;
    when others => output <= "00000000";
 end case;
 
end if;

end process;

end behavioral;
