-- gehad File

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY mux3_1 IS  
      GENERIC ( n : integer := 16);
      PORT (IN1,IN2,IN3,IN4,IN5 : IN std_logic_vector(n-1 downto 0);
            SEl	:  IN std_logic_vector(2 downto 0);
            OUT1 : OUT  std_logic_vector(n-1 downto 0));    
END ENTITY mux3_1;


ARCHITECTURE arch_mux3_1 OF mux3_1 IS
BEGIN
       out1 <= in1 WHEN sel(0)= '0' AND sel(1) ='0' AND sel(2) ='0'
           ELSE in2 WHEN sel(0)= '1' AND sel(1) ='0' AND sel(2) ='0'
           ELSE in3 WHEN sel(0)= '0' AND sel(1) ='1' AND sel(2) ='0'
           ELSE in4 WHEN sel(0)= '1' AND sel(1) ='1' AND sel(2) ='0'
           ELSE in5 WHEN sel(0)= '0' AND sel(1) ='0' AND sel(2) ='1';
     
END arch_mux3_1;