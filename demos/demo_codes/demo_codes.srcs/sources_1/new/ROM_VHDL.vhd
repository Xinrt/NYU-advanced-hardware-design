----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/10/20 23:20:43
-- Design Name: 
-- Module Name: ROM_VHDL - Behavioral
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
use IEEE.std_logic_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- 16*4 ROM
entity ROM_VHDL is
  Port ( 
    clk: in std_logic;    -- clock signal
    addr: in std_logic_vector(3 downto 0);   -- 4-bit address
    data: out std_logic_vector(3 downto 0)   -- 4-bit output
  );
end ROM_VHDL;

architecture RTL of ROM_VHDL is
type marray is array (0 to 15) of std_logic_vector(3 downto 0);
constant rom: marray := (X"4",X"C",X"8",X"E",X"F",X"3",X"1",X"D",X"7",X"9",X"2",X"0",X"E",X"3",X"F");
--constant rom: marray := ("0000", "1100", "1010", "1110", "1111", "0001", "0011", "0000", "1111", "1110", "0011", "1111", "0101", "1100", "1100", "1111");


begin
process(clk)
begin
if(clk'event and clk='1') then
    data <= rom(conv_integer(addr));
end if;
end process;

end RTL;
