
-- gehad File
-- This Register is latch which read data in 0 level

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY reg_latch IS
 GENERIC ( n : integer := 16);
PORT( Clk_reg_latch , en_reg_latch, Rst_reg_latch : IN std_logic;
      dataIn_reg_latch : IN std_logic_vector(n-1 DOWNTO 0);
      dataOut_reg_latch : OUT std_logic_vector(n-1 DOWNTO 0));
END reg_latch;

ARCHITECTURE arch_reg_latch OF reg_latch IS
BEGIN
   dataOut_reg_latch <= dataIn_reg_latch WHEN Clk_reg_latch='0' and Rst_reg_latch='0' and en_reg_latch='1' 
          ELSE (OTHERS=>'0') WHEN Rst_reg_latch ='1';

END arch_reg_latch;