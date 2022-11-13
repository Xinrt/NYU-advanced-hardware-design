----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/10/12 14:57:33
-- Design Name: 
-- Module Name: test_left_rotate - Behavioral
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

use std.textio.all;
use ieee.std_logic_textio.all;

entity test_left_rotate is
--  Port ( );
end test_left_rotate;

architecture Behavioral of test_left_rotate is
file file_pointer: text;
signal dut_in: std_logic_vector(31 downto 0);
signal dut_shift: std_logic_vector(4 downto 0);
signal dut_out: std_logic_vector(31 downto 0);

begin
dut: entity work.left_rotate port map(
    inVariable => dut_in,
    shiftBit => dut_shift,
    outVariable => dut_out
);

end Behavioral;
