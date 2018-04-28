-- gehad File

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY mux2_1 IS  
      GENERIC ( n : integer := 16);
      PORT (IN1,IN2 : in std_logic_vector(n-1 downto 0);
            SEl	:  IN std_logic;
            OUT1 : OUT  std_logic_vector(n-1 downto 0));    
END ENTITY mux2_1;


ARCHITECTURE arch_mux2_1 OF mux2_1 IS
BEGIN
     
   out1 <= in1 WHEN sel='0' 
         else in2;
     
END arch_mux2_1;
