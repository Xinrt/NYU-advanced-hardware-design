----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/10/21 00:12:16
-- Design Name: 
-- Module Name: RAM_VHDL - Behavioral
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

entity RAM_VHDL is
  Port ( 
    clk: in std_logic;
    readwrite: in std_logic; -- read = 0, write = 1
    addr: in std_logic_vector(3 downto 0);
    datain: in std_logic_vector(7 downto 0);
    dataout: out std_logic_vector(7 downto 0)
  );
end RAM_VHDL;

architecture RTL of RAM_VHDL is
type ram is array (0 to 15) of std_logic_vector(7 downto 0);
signal skey: ram;

begin
process(clk)
begin 
if(clk'event and clk='1') then 
    if(readwrite = '1') then
        skey(CONV_INTEGER(addr)) <= datain;
    end if;
end if;
end process;

dataout <= skey(CONV_INTEGER(addr));

end RTL;
