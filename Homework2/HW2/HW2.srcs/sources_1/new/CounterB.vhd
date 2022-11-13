----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/09/28 20:18:43
-- Design Name: 
-- Module Name: CounterB - Behavioral
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CounterB is
Port (
    clk: in std_logic;
    rst: in std_logic;
    cnt_en: in std_logic;
    cnt: out std_logic_vector (15 downto 0)
);
end CounterB;

architecture Behavioral of CounterB is
signal clk_divider_counter : std_logic_vector (41 downto 0) := "000000000000001111111111111111111111111111";

begin
process(rst, clk) begin
    if(cnt_en='1') then
        if(rst='1') then clk_divider_counter<="000000000000001111111111111111111111111111";
        else if(clk'event and clk='1') then
            if(clk_divider_counter="000000000000000000000000000000000000000000") then clk_divider_counter<="000000000000001111111111111111111111111111";
            else clk_divider_counter<=clk_divider_counter-'1';
            end if;
        end if;
        end if;
    end if;
end process;
cnt <= clk_divider_counter(41 downto 26);

end Behavioral;
