----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/09/28 23:30:04
-- Design Name: 
-- Module Name: board - Behavioral
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

entity board is
Port (
    CLK100MHZ: in std_logic;
    sw: in std_logic_vector(15 downto 0);
    LED: out std_logic_vector(15 downto 0)
);
end board;

architecture Behavioral of board is

begin
board_instance: entity work.CounterB port map (
clk => CLK100MHZ,
rst=>sw(0),
cnt_en=>sw(1),
cnt=>LED
);


end Behavioral;
