----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/10/20 22:36:22
-- Design Name: 
-- Module Name: down_counter_board - Behavioral
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

entity down_counter_board is
  Port ( 
    CLK100MHZ: in std_logic;
    sw: in std_logic_vector(15 downto 0);
    LED: out std_logic_vector(15 downto 0)
  );
end down_counter_board;

architecture Behavioral of down_counter_board is

begin
    board_instance: entity work.down_counter_VHDL port map (
        clk => CLK100MHZ,
        rst=>sw(0),
        cnt_en=>sw(1),
        cnt=>LED
    );

end Behavioral;
