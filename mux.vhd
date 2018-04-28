LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY mux IS  
		GENERIC ( n : integer := 16);
		PORT (IN1,IN2 : in std_logic_vector( n-1 downto 0);
		     S :  IN std_logic;
  		     OUT1 : OUT  std_logic_vector( n-1 downto 0));     
END ENTITY mux;


ARCHITECTURE Data_flow OF mux IS
BEGIN
     
   out1 <= in1 when s = '0'
   else in2;
END Data_flow;



