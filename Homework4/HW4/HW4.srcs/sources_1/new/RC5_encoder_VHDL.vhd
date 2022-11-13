----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/11/11 08:38:21
-- Design Name: 
-- Module Name: RC5_encoder_VHDL - Behavioral
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
library WORK;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE WORK.RC5_PKG.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RC5_encoder_VHDL is
Port ( 
    clr: in std_logic;    -- asynchronous reset
    clk: in std_logic;    -- clock signal
    key_rdy: in std_logic;
    di_vld: in std_logic;   -- start encryption
    din: in std_logic_vector(63 downto 0);       -- 64-bit input
    skey: in S_ARRAY;
    dout: out std_logic_vector(63 downto 0);       -- 64-bit output
    do_rdy: out std_logic       -- encode done
  );

end RC5_encoder_VHDL;

architecture Behavioral of RC5_encoder_VHDL is
--counter (the minimal value of iteration is suggested to be 16)
signal i_cnt: unsigned(3 downto 0):="0001";

-- A signal (1/2 input)
signal a_reg: std_logic_vector(31 downto 0);    -- a register
signal a_xor: std_logic_vector(31 downto 0);
signal a_rot: std_logic_vector(31 downto 0);
signal a_pre: std_logic_vector(31 downto 0);
signal a: std_logic_vector(31 downto 0);

-- B signal (1/2 input)
signal b_reg: std_logic_vector(31 downto 0);    -- b register
signal b_xor: std_logic_vector(31 downto 0);
signal b_rot: std_logic_vector(31 downto 0);
signal b_pre: std_logic_vector(31 downto 0);
signal b: std_logic_vector(31 downto 0);

TYPE StateType IS (ST_IDLE, ST_PER_ROUND, ST_ROUND_OP, ST_READY);
SIGNAL state: StateType;

begin
    -- simple function state machine (i_cnt='1100')
    process(clk, clr) begin
        if(clr = '0') then
            state <= ST_IDLE;
        elsif(clk'event and clk='1') then 
            case state is
                when ST_IDLE => if (di_vld='1'and key_rdy ='1') then state <= ST_PER_ROUND; end if;
                when ST_PER_ROUND => state <= ST_ROUND_OP;
                when ST_ROUND_OP => if(i_cnt = "1100") then state <= ST_READY; end if;  -- 12 round
                when ST_READY => state <= ST_IDLE;
            end case;
        end if; 
    end process;
    
    a_xor <= a_reg xor b_reg;
    with b_reg(4 downto 0) select 
        a_rot <= a_xor(30 downto 0) & a_xor(31) when "00001",
                 a_xor(29 downto 0) & a_xor(31 downto 30) when "00010",
                 a_xor(28 downto 0) & a_xor(31 downto 29) when "00011",
                 a_xor(27 downto 0) & a_xor(31 downto 28) when "00100",
                 a_xor(26 downto 0) & a_xor(31 downto 27) when "00101",
                 a_xor(25 downto 0) & a_xor(31 downto 26) when "00110",
                 a_xor(24 downto 0) & a_xor(31 downto 25) when "00111",
                 a_xor(23 downto 0) & a_xor(31 downto 24) when "01000",
                 a_xor(22 downto 0) & a_xor(31 downto 23) when "01001",
                 a_xor(21 downto 0) & a_xor(31 downto 22) when "01010",
                 a_xor(20 downto 0) & a_xor(31 downto 21) when "01011",
                 a_xor(19 downto 0) & a_xor(31 downto 20) when "01100",
                 a_xor(18 downto 0) & a_xor(31 downto 19) when "01101",
                 a_xor(17 downto 0) & a_xor(31 downto 18) when "01110",
                 a_xor(16 downto 0) & a_xor(31 downto 17) when "01111",
                 a_xor(15 downto 0) & a_xor(31 downto 16) when "10000",
                 a_xor(14 downto 0) & a_xor(31 downto 15) when "10001",
                 a_xor(13 downto 0) & a_xor(31 downto 14) when "10010",
                 a_xor(12 downto 0) & a_xor(31 downto 13) when "10011",
                 a_xor(11 downto 0) & a_xor(31 downto 12) when "10100",
                 a_xor(10 downto 0) & a_xor(31 downto 11) when "10101",
                 a_xor(9 downto 0) & a_xor(31 downto 10) when "10110",
                 a_xor(8 downto 0) & a_xor(31 downto 9) when "10111",
                 a_xor(7 downto 0) & a_xor(31 downto 8) when "11000",
                 a_xor(6 downto 0) & a_xor(31 downto 7) when "11001",
                 a_xor(5 downto 0) & a_xor(31 downto 6) when "11010",
                 a_xor(4 downto 0) & a_xor(31 downto 5) when "11011",
                 a_xor(3 downto 0) & a_xor(31 downto 4) when "11100",
                 a_xor(2 downto 0) & a_xor(31 downto 3) when "11101",
                 a_xor(1 downto 0) & a_xor(31 downto 2) when "11110",
                 a_xor(0) & a_xor(31 downto 1) when "11111",
                 a_xor when others;
    -- add 
    a_pre<=din(63 downto 32) + skey(0);     -- A=A+S[0]
--    a<=a_rot + skey(CONV_INTEGER(i_cnt & '0'));   -- S[2i]
    a<=std_logic_vector(unsigned(a_rot)+unsigned(skey(to_integer(i_cnt)*2)));   -- S[2i]
            
    b_xor <= b_reg xor a;
    with a(4 downto 0) select 
        b_rot <= b_xor(30 downto 0) & b_xor(31) when "00001",
                 b_xor(29 downto 0) & b_xor(31 downto 30) when "00010",
                 b_xor(28 downto 0) & b_xor(31 downto 29) when "00011",
                 b_xor(27 downto 0) & b_xor(31 downto 28) when "00100",
                 b_xor(26 downto 0) & b_xor(31 downto 27) when "00101",
                 b_xor(25 downto 0) & b_xor(31 downto 26) when "00110",
                 b_xor(24 downto 0) & b_xor(31 downto 25) when "00111",
                 b_xor(23 downto 0) & b_xor(31 downto 24) when "01000",
                 b_xor(22 downto 0) & b_xor(31 downto 23) when "01001",
                 b_xor(21 downto 0) & b_xor(31 downto 22) when "01010",
                 b_xor(20 downto 0) & b_xor(31 downto 21) when "01011",
                 b_xor(19 downto 0) & b_xor(31 downto 20) when "01100",
                 b_xor(18 downto 0) & b_xor(31 downto 19) when "01101",
                 b_xor(17 downto 0) & b_xor(31 downto 18) when "01110",
                 b_xor(16 downto 0) & b_xor(31 downto 17) when "01111",
                 b_xor(15 downto 0) & b_xor(31 downto 16) when "10000",
                 b_xor(14 downto 0) & b_xor(31 downto 15) when "10001",
                 b_xor(13 downto 0) & b_xor(31 downto 14) when "10010",
                 b_xor(12 downto 0) & b_xor(31 downto 13) when "10011",
                 b_xor(11 downto 0) & b_xor(31 downto 12) when "10100",
                 b_xor(10 downto 0) & b_xor(31 downto 11) when "10101",
                 b_xor(9 downto 0) & b_xor(31 downto 10) when "10110",
                 b_xor(8 downto 0) & b_xor(31 downto 9) when "10111",
                 b_xor(7 downto 0) & b_xor(31 downto 8) when "11000",
                 b_xor(6 downto 0) & b_xor(31 downto 7) when "11001",
                 b_xor(5 downto 0) & b_xor(31 downto 6) when "11010",
                 b_xor(4 downto 0) & b_xor(31 downto 5) when "11011",
                 b_xor(3 downto 0) & b_xor(31 downto 4) when "11100",
                 b_xor(2 downto 0) & b_xor(31 downto 3) when "11101",
                 b_xor(1 downto 0) & b_xor(31 downto 2) when "11110",
                 b_xor(0) & b_xor(31 downto 1) when "11111",
                 b_xor when others;
    -- add 
    b_pre<=din(31 downto 0) + skey(1);   -- B = B + S[1]
--    b<=b_rot + skey(CONV_INTEGER(i_cnt & '1'));    -- S[2i+1]
    b<=std_logic_vector(unsigned(b_rot)+unsigned(skey(to_integer(i_cnt)*2+1)));         -- S[2i+1]

    -- update A register 
    process(clr, clk) begin
        if(clr='0') then
            a_reg<=(OTHERS=>'0');
        elsif(clk'event and clk='1') then 
            if(state=ST_PER_ROUND) then 
                a_reg <= a_pre;
            end if;
            if(state=ST_ROUND_OP) then
                a_reg<=a;
            end if;
        end if;
    end process;
    
    -- update B register 
    process(clr, clk) begin
        if(clr='0') then
            b_reg<=(OTHERS=>'0');
        elsif(clk'event and clk='1') then
            if(state=ST_PER_ROUND) then 
                b_reg <= b_pre;
            end if;
            if(state=ST_ROUND_OP) then
                b_reg<=b;
            end if;
        end if;
    end process; 
    
    -- round counter  
    process(clr, clk) begin
        if(clr='0') then
            i_cnt<="0001";
        elsif(clk'event and clk='1') then
            if(state=ST_ROUND_OP) then
                if(i_cnt="1100") then
                    i_cnt<="0001";
                else    
                    i_cnt<=i_cnt+1;
                end if;
            end if;
        end if;
    end process;
    
    -- combine A register and B register to get the final encoded output
    dout<=a_reg & b_reg;
    with state select
        do_rdy<='1' when ST_READY,      -- handshake signal
                '0' when others;


end Behavioral;
