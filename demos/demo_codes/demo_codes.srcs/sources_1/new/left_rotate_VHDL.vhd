----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/10/20 21:10:54
-- Design Name: 
-- Module Name: left_rotate_VHDL - Behavioral
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

entity left_rotate_VHDL is
  Port ( 
      inVariable : in std_logic_vector(7 downto 0);
      shiftBit : in std_logic_vector(2 downto 0);
      outVariable : out std_logic_vector(7 downto 0)
  );
end left_rotate_VHDL;

architecture Behavioral of left_rotate_VHDL is

begin
    with shiftBit(2 downto 0) SELECT
    outVariable <= inVariable(7 downto 0) when "000",
                  inVariable(6 downto 0) & inVariable(7) when "001",
                  inVariable(5 downto 0) & inVariable(7 downto 6) when "010",
                  inVariable(4 downto 0) & inVariable(7 downto 5) when "011",
                  inVariable(3 downto 0) & inVariable(7 downto 4) when "100",
                  inVariable(2 downto 0) & inVariable(7 downto 3) when "101",
                  inVariable(1 downto 0) & inVariable(7 downto 2) when "110",
                  inVariable(0) & inVariable(7 downto 1) when "111",
                  inVariable when others;

end Behavioral;
