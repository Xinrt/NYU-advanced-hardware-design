----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/11/11 08:41:09
-- Design Name: 
-- Module Name: RC5_PKG - Behavioral
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

package RC5_PKG is

TYPE S_ARRAY IS ARRAY (0 TO 25) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
TYPE L_ARRAY IS ARRAY (0 TO 3) OF STD_LOGIC_VECTOR(31 DOWNTO 0);

end package RC5_PKG;


