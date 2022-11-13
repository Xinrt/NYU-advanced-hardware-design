----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/11/11 08:53:53
-- Design Name: 
-- Module Name: RC5_key_generation - Behavioral
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
use IEEE.std_logic_unsigned.all;
USE WORK.RC5_PKG.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RC5_key_generation is
Port ( 
    clr, clk: std_logic; 
    key_in: std_logic;
    ukey: std_logic_vector(127 downto 0);
    skey: out std_logic_vector(31 downto 0);
    key_rdy: out std_logic
  );
end RC5_key_generation;

architecture Behavioral of RC5_key_generation is

signal a_reg: std_logic_vector(31 downto 0);
signal b_reg: std_logic_vector(31 downto 0);
signal a_tmp1: std_logic_vector(31 downto 0);
signal a_tmp2: std_logic_vector(31 downto 0);
signal ab_tmp: std_logic_vector(31 downto 0);
signal b_tmp1: std_logic_vector(31 downto 0);
signal b_tmp2: std_logic_vector(31 downto 0);
signal l_arr: L_ARRAY;
signal s_arr_tmp: S_ARRAY;

signal i_cnt: integer range 0 to 25;
signal j_cnt: integer range 0 to 3;
signal k_cnt: integer range 0 to 77;

TYPE StateType IS (ST_IDLE, ST_KEY_INIT, ST_KEY_EXP,ST_READY);
signal state: StateType;

begin
    -- state
    process(clr, clk) begin
        if(clr='0') then 
            state <= ST_IDLE;
        elsif(clk'event and clk='1') then 
            case state is 
                when ST_IDLE => if(key_in='1') then state<=ST_KEY_INIT; end if;
                when ST_KEY_INIT => state<=ST_KEY_EXP;
                when ST_KEY_EXP => if(k_cnt=77) then state<=ST_READY; end if;      
                when ST_READY => state<=ST_IDLE;
            end case;
        end if;
    end process;
    
    -- initialize S_ARRAY
    -- S[0] = 0xB7E15163 (Pw)
    -- for i=1 to 25 do S[i] = S[i-1] + 0x9E3779B9 (Qw)
    process(clr, clk) begin
        if(clr='0') THEN 
            s_arr_tmp(0)<= "10110111111000010101000101100011";
            s_arr_tmp(1)<= "01010110000110001100101100011100";
            s_arr_tmp(2)<= "11110100010100000100010011010101";
            s_arr_tmp(3)<= "10010010100001111011111010001110";
            s_arr_tmp(4)<= "00110000101111110011100001000111";
            s_arr_tmp(5)<= "11001110111101101011001000000000";
            s_arr_tmp(6)<= "01101101001011100010101110111001";
            s_arr_tmp(7)<= "00001011011001011010010101110010";
            s_arr_tmp(8)<= "10101001100111010001111100101011";
            s_arr_tmp(9)<= "01000111110101001001100011100100";
            s_arr_tmp(10)<= "11100110000011000001001010011101";
            s_arr_tmp(11)<= "10000100010000111000110001010110";
            s_arr_tmp(12)<= "00100010011110110000011000001111";
            s_arr_tmp(13)<= "11000000101100100111111111001000";
            s_arr_tmp(14)<= "01011110111010011111100110000001";
            s_arr_tmp(15)<= "11111101001000010111001100111010";
            s_arr_tmp(16)<= "10011011010110001110110011110011";
            s_arr_tmp(17)<= "00111001100100000110011010101100";
            s_arr_tmp(18)<= "11010111110001111110000001100101";
            s_arr_tmp(19)<= "01110101111111110101101000011110";
            s_arr_tmp(20)<= "00010100001101101101001111010111";
            s_arr_tmp(21)<= "10110010011011100100110110010000";
            s_arr_tmp(22)<= "01010000101001011100011101001001";
            s_arr_tmp(23)<= "11101110110111010100000100000010";
            s_arr_tmp(24)<= "10001101000101001011101010111011";
            s_arr_tmp(25)<= "00101011010011000011010001110100";
        elsif(clk'event and clk='1') then 
            if(state=ST_KEY_EXP) then s_arr_tmp(i_cnt)<=a_tmp2;
            end if;
        end if;      
    end process;
        
    -- initialize L_ARRAY
    process(clr, clk) begin 
        if(clr='0') then 
            for i in 0 to 3 loop
                l_arr(i)<=(OTHERS=>'0');
            end loop;
        elsif(clk'event and clk='1') then 
            if(state=ST_KEY_INIT) then
                l_arr(0)<=ukey(31 DOWNTO 0);
                l_arr(1)<=ukey(63 DOWNTO 32);
                l_arr(2)<=ukey(95 DOWNTO 64);
                l_arr(3)<=ukey(127 DOWNTO 96);
            elsif(state<=ST_KEY_EXP) then 
                l_arr(j_cnt)<=b_tmp2;
            end if;
        end if;
    end process;
    
    -- A register
    process(clr, clk) begin
        if(clr='0') then 
            a_reg<=(OTHERS=>'0');
        elsif(clk'event and clk='1') then 
            if(state=ST_KEY_EXP) then a_reg<=a_tmp2;
            end if;
        end if;
    end process;
    
    -- B register
    process(clr, clk) begin
        if(clr='0') then 
            b_reg<=(OTHERS=>'0');
        elsif(clk'event and clk='1') then 
            if(state=ST_KEY_EXP) then b_reg<=b_tmp2;
            end if;
        end if;
    end process;
    
    -- i 0 to 25 counter
    process(clr, clk) begin
        if(clr='0') then i_cnt<=0;
        elsif(clk'event and clk='1') then 
            if(state=ST_KEY_EXP) then 
                if(i_cnt=25) then i_cnt<=0;
                else i_cnt<=i_cnt+1;
                end if;
            end if;
        end if;
    end process;
    
    -- j 0 to 3 counter
    process(clr, clk) begin
        if(clr='0') then j_cnt<=0;
        elsif(clk'event and clk='1') then 
            if(state=ST_KEY_EXP) then 
                if(j_cnt=3) then j_cnt<=0;
                else j_cnt<=j_cnt+1;
                end if;
            end if;
        end if;
    end process;
    
    -- k 0 to 77 counter
    process(clr, clk) begin
        if(clr='0') then k_cnt<=0;
        elsif(clk'event and clk='1') then 
            if(state=ST_KEY_EXP) then 
                if(k_cnt=77) then k_cnt<=0;
                else k_cnt<=k_cnt+1;
                end if;
            end if;
        end if;
    end process;

-- assign values    
    a_tmp1<=std_logic_vector(unsigned(s_arr_tmp(i_cnt))+unsigned(a_reg)+unsigned(b_reg)); 
    a_tmp2<=a_tmp1(28 DOWNTO 0) & a_tmp1(31 DOWNTO 29);
    
    WITH ab_tmp(4 DOWNTO 0) SELECT
    b_tmp2 <= b_tmp1(30 downto 0) & b_tmp1(31) WHEN "00001",
                b_tmp1(29 downto 0) & b_tmp1(31 downto 30) WHEN "00010",
                b_tmp1(28 downto 0) & b_tmp1(31 downto 29) WHEN "00011",
                b_tmp1(27 downto 0) & b_tmp1(31 downto 28) WHEN "00100",
                b_tmp1(26 downto 0) & b_tmp1(31 downto 27) WHEN "00101",
                b_tmp1(25 downto 0) & b_tmp1(31 downto 26) WHEN "00110",
                b_tmp1(24 downto 0) & b_tmp1(31 downto 25) WHEN "00111",
                b_tmp1(23 downto 0) & b_tmp1(31 downto 24) WHEN "01000",
                b_tmp1(22 downto 0) & b_tmp1(31 downto 23) WHEN "01001",
                b_tmp1(21 downto 0) & b_tmp1(31 downto 22) WHEN "01010",
                b_tmp1(20 downto 0) & b_tmp1(31 downto 21) WHEN "01011",
                b_tmp1(19 downto 0) & b_tmp1(31 downto 20) WHEN "01100",
                b_tmp1(18 downto 0) & b_tmp1(31 downto 19) WHEN "01101",
                b_tmp1(17 downto 0) & b_tmp1(31 downto 18) WHEN "01110",
                b_tmp1(16 downto 0) & b_tmp1(31 downto 17) WHEN "01111",
                b_tmp1(15 downto 0) & b_tmp1(31 downto 16) WHEN "10000",
                b_tmp1(14 downto 0) & b_tmp1(31 downto 15) WHEN "10001",
                b_tmp1(13 downto 0) & b_tmp1(31 downto 14) WHEN "10010",
                b_tmp1(12 downto 0) & b_tmp1(31 downto 13) WHEN "10011",
                b_tmp1(11 downto 0) & b_tmp1(31 downto 12) WHEN "10100",
                b_tmp1(10 downto 0) & b_tmp1(31 downto 11) WHEN "10101",
                b_tmp1(9 downto 0) & b_tmp1(31 downto 10) WHEN "10110",
                b_tmp1(8 downto 0) & b_tmp1(31 downto 9) WHEN "10111",
                b_tmp1(7 downto 0) & b_tmp1(31 downto 8) WHEN "11000",
                b_tmp1(6 downto 0) & b_tmp1(31 downto 7) WHEN "11001",
                b_tmp1(5 downto 0) & b_tmp1(31 downto 6) WHEN "11010",
                b_tmp1(4 downto 0) & b_tmp1(31 downto 5) WHEN "11011",
                b_tmp1(3 downto 0) & b_tmp1(31 downto 4) WHEN "11100",
                b_tmp1(2 downto 0) & b_tmp1(31 downto 3) WHEN "11101",
                b_tmp1(1 downto 0) & b_tmp1(31 downto 2) WHEN "11110",
                b_tmp1(0) & b_tmp1(31 downto 1) when "11111",
                b_tmp1 when others;

    -- output
    process(clr, clk) begin
        if(clr='0') then
            key_rdy<='0';
        elsif(clk'event and clk='1') then
            if(state=ST_READY) then
                skey<=std_logic_vector(s_arr_tmp);
                key_rdy<='1';
            end if;
        end if;
    end process;


end Behavioral;
