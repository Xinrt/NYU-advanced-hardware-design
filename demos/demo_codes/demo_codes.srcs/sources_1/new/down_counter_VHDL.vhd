----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/10/20 22:32:38
-- Design Name: 
-- Module Name: down_counter_VHDL - Behavioral
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

entity down_counter_VHDL is
  Port ( 
    clk: in std_logic;
    rst: in std_logic;
    cnt_en: in std_logic;
    cnt: out std_logic_vector (15 downto 0)
  );
end down_counter_VHDL;

architecture Behavioral of down_counter_VHDL is
signal clk_divider_counter : std_logic_vector (15 downto 0) := "0000000000000001";

begin
    -- asynchronous: process(cnt_en, rst, clk)
    -- 异步计数器是异步时序电路，其主要特点是内部各触发器的时钟脉冲端CP不全都连接在一起，
    -- 因此各触发器的翻转时刻有先有后，其输出可能会产生干扰毛刺现象，但其电路结构简单。
    process(cnt_en, rst, clk) begin
        if(cnt_en='1') then
            if(rst='1') then clk_divider_counter<="0000000000000011";
            else if(clk'event and clk='1') then
                if(clk_divider_counter="0000000000000000") then clk_divider_counter<="0000000000000011";
                else clk_divider_counter<=clk_divider_counter-'1';
                end if;
            end if;
            end if;
        end if;
    end process;
    cnt <= clk_divider_counter(15 downto 0);
    
--    -- synchronous: process(clk)
--    -- 同步计数器指的是被测量累计值，其特点是大大提高了计数器工作频率 
--    -- 对于同步计数器，由于时钟脉冲同时作用于各个触发器，克服了异步触发器
--    -- 所遇到的触发器逐级延迟问题，于是大大提高了计数器工作频率，各级触发
--    -- 器输出相差小，译码时能避免出现尖峰；但是如果同步计数器级数增加，就会使得计数脉冲的负载加重。
--    process(clk) begin
--        if(clk'event and clk='1') then
--            if(cnt_en='1') then
--                 if(rst='1') then clk_divider_counter<="0000000000000011";
--                 else if(clk_divider_counter="0000000000000000") then clk_divider_counter<="0000000000000011";
--                 else clk_divider_counter<=clk_divider_counter-'1';
--                 end if;
--            end if;
--        end if;
--        end if;
--    end process;
--    cnt <= clk_divider_counter(15 downto 0);
end Behavioral;
