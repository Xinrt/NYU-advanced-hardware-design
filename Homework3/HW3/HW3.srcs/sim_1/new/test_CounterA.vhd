----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/10/12 21:25:39
-- Design Name: 
-- Module Name: test_CounterA - Behavioral
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

entity test_CounterA is
--  Port ( );
end test_CounterA;

architecture Behavioral of test_CounterA is
file file_pointer: text;
signal in_clk: std_logic;
signal in_rst: std_logic;
signal in_cnt_en: std_logic;
signal out_cnt: std_logic_vector(15 downto 0);

begin
dut: entity work.CounterA port map(
    clk => in_clk,
    rst => in_rst,
    cnt_en => in_cnt_en,
    cnt => out_cnt
);

process 
    variable file_line: line;
    variable file_arg1: std_logic;
    variable file_arg2: std_logic;
    variable file_arg3: std_logic_vector(15 downto 0);
    variable file_space: character;
    
    begin
    file_open(file_pointer, "test_counterA_cases.csv", READ_MODE);
    in_clk <= '0';
    while not endfile(file_pointer) loop
        wait for 1ns;
        in_clk <= '0';
        readline(file_pointer, file_line);
        read(file_line, file_arg1);
        read(file_line, file_space);
        read(file_line, file_arg2);
        read(file_line, file_space);
        read(file_line, file_arg3);
        
        in_cnt_en <= file_arg1;
        in_rst <= file_arg2;
        wait for 1ns;
        in_clk <= '1';
        
        assert(out_cnt = file_arg3) report "test case error - wrong output" severity FAILURE;
    
    end loop;
    report "All test cases passed successfully";
    std.env.stop;
end process;

end Behavioral;
