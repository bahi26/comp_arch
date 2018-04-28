LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY mux4x2 IS  
		
		PORT (IN1,IN2,IN3,IN4 : in std_logic_vector( 15 downto 0);
		     S :  IN std_logic_vector(1 downto 0);
  		     OUT1 : OUT  std_logic_vector( 15 downto 0));     
END ENTITY mux4x2;


ARCHITECTURE Data_flow OF mux4x2 IS
BEGIN
     
   out1 <= in1 when s = "00"
   else in2 when s="01"
else in3 when s="10"
else in4;
END Data_flow;



