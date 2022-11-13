----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/10/20 22:18:22
-- Design Name: 
-- Module Name: test_left_rotate_vhdl - Behavioral
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


entity test_left_rotate_vhdl is
--  Port ( );
end test_left_rotate_vhdl;

architecture Behavioral of test_left_rotate_vhdl is
-- variables
file file_pointer: text;
signal in_dat: std_logic_vector(7 downto 0);
signal in_shift: std_logic_vector(2 downto 0);
signal out_dat: std_logic_vector(7 downto 0);

begin
-- link the design source file 
dut: entity work.left_rotate_vhdl port map(
    inVariable => in_dat,
    shiftBit => in_shift,
    outVariable => out_dat
);

process 
    -- file variables
    variable file_line: line;
    variable file_arg1: std_logic_vector(7 downto 0);
    variable file_arg2: std_logic_vector(2 downto 0);
    variable file_arg3: std_logic_vector(7 downto 0);
    variable file_space: character;
    
    -- read from the file
    begin
    file_open(file_pointer, "test_left_rotate_vhdl_cases.csv", READ_MODE);
    
    while not endfile(file_pointer) loop
        readline(file_pointer, file_line);
        read(file_line, file_arg1);
        read(file_line, file_space);
        read(file_line, file_arg2);
        read(file_line, file_space);
        read(file_line, file_arg3);
        
        in_dat <= file_arg1;
        in_shift <= file_arg2;
        -- remember to wait
        wait for 1ns;
        
        -- display the value of the variables
--        for i in 0 to file_arg3'length-1 loop
--            report "arg3"&std_logic'image(file_arg3(i));
--            report "out_dat"&std_logic'image(out_dat(i));
--        end loop;

        assert(out_dat = file_arg3) report "test case error - wrong output" severity FAILURE;
    
    end loop;
    report "All test cases passed successfully";
    std.env.stop;
end process;

end Behavioral;
