-- gehad File
-- This Register read data in falling_edge

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY SP_reg IS
GENERIC ( n : integer := 16);
PORT( Clk_reg ,Rst_reg ,en_reg: IN std_logic;
      dataIn_reg : IN std_logic_vector(n-1 DOWNTO 0);
      dataOut_reg : OUT std_logic_vector(n-1 DOWNTO 0));
END SP_reg;

ARCHITECTURE arch_SP_reg OF SP_reg IS
BEGIN
PROCESS (Clk_reg,Rst_reg,en_reg)
BEGIN
   
   -- reset SP = 1023
   IF Rst_reg = '1' THEN
		dataOut_reg <= (OTHERS=>'1');
   elsiF en_reg = '1' then
      IF falling_edge(Clk_reg) THEN
		dataOut_reg <= dataIn_reg;
      END IF;
   END IF;
END PROCESS;
END arch_SP_reg;