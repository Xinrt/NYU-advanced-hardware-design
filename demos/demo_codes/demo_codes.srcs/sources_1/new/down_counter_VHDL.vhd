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
    -- �첽���������첽ʱ���·������Ҫ�ص����ڲ�����������ʱ�������CP��ȫ��������һ��
    -- ��˸��������ķ�תʱ�������к���������ܻ��������ë�����󣬵����·�ṹ�򵥡�
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
--    -- ͬ��������ָ���Ǳ������ۼ�ֵ�����ص��Ǵ������˼���������Ƶ�� 
--    -- ����ͬ��������������ʱ������ͬʱ�����ڸ������������˷����첽������
--    -- �������Ĵ��������ӳ����⣬���Ǵ������˼���������Ƶ�ʣ���������
--    -- ��������С������ʱ�ܱ�����ּ�壻�������ͬ���������������ӣ��ͻ�ʹ�ü�������ĸ��ؼ��ء�
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
