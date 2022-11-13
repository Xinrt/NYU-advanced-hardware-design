----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/09/14 20:25:20
-- Design Name: 
-- Module Name: right_rotate - Behavioral
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

entity right_rotate is
 Port (
 inVariable : in std_logic_vector(31 downto 0);
 shiftBit : in std_logic_vector(4 downto 0);
 outVariable : out std_logic_vector(31 downto 0));
end right_rotate;

architecture Behavioral of right_rotate is

begin
    with shiftBit(4 downto 0) select
        outVariable <= inVariable(31 downto 0) when "00000",
                    inVariable(0) & inVariable(31 downto 1) when "00001",
                    inVariable(1 downto 0) & inVariable(31 downto 2) when "00010",
                    inVariable(2 downto 0) & inVariable(31 downto 3) when "00011",
                    inVariable(3 downto 0) & inVariable(31 downto 4) when "00100",
                    inVariable(4 downto 0) & inVariable(31 downto 5) when "00101",
                    inVariable(5 downto 0) & inVariable(31 downto 6) when "00110",
                    inVariable(6 downto 0) & inVariable(31 downto 7) when "00111",
                    inVariable(7 downto 0) & inVariable(31 downto 8) when "01000",
                    inVariable(8 downto 0) & inVariable(31 downto 9) when "01001",
                    inVariable(9 downto 0) & inVariable(31 downto 10) when "01010",
                    inVariable(10 downto 0) & inVariable(31 downto 11) when "01011",
                    inVariable(11 downto 0) & inVariable(31 downto 12) when "01100",
                    inVariable(12 downto 0) & inVariable(31 downto 13) when "01101",
                    inVariable(13 downto 0) & inVariable(31 downto 14) when "01110",
                    inVariable(14 downto 0) & inVariable(31 downto 15) when "01111",
                    inVariable(15 downto 0) & inVariable(31 downto 16) when "10000",
                    inVariable(16 downto 0) & inVariable(31 downto 17) when "10001",
                    inVariable(17 downto 0) & inVariable(31 downto 18) when "10010",
                    inVariable(18 downto 0) & inVariable(31 downto 19) when "10011",
                    inVariable(19 downto 0) & inVariable(31 downto 20) when "10100",
                    inVariable(20 downto 0) & inVariable(31 downto 21) when "10101",
                    inVariable(21 downto 0) & inVariable(31 downto 22) when "10110",
                    inVariable(22 downto 0) & inVariable(31 downto 23) when "10111",
                    inVariable(23 downto 0) & inVariable(31 downto 24) when "11000",
                    inVariable(24 downto 0) & inVariable(31 downto 25) when "11001",
                    inVariable(25 downto 0) & inVariable(31 downto 26) when "11010",
                    inVariable(26 downto 0) & inVariable(31 downto 27) when "11011",
                    inVariable(27 downto 0) & inVariable(31 downto 28) when "11100",
                    inVariable(28 downto 0) & inVariable(31 downto 29) when "11101",
                    inVariable(29 downto 0) & inVariable(31 downto 30) when "11110",
                    inVariable(30 downto 0) & inVariable(31) when "11111",
                    inVariable when others;


end Behavioral;
