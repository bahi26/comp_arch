-- gehad File

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dec2_4 is
    Port ( A  : in  STD_LOGIC_VECTOR (1 downto 0); 
           dec_out  : out STD_LOGIC_VECTOR (3 downto 0);  
           EN : in  STD_LOGIC);                     
end dec2_4;

architecture arch_dec2_4 of dec2_4 is
begin
process (A, EN)
begin
    
 If en ='1' then
    IF(A = "00") THEN  
        dec_out <= "0001" ;
    ELSIF (A = "01") THEN 
	dec_out <= "0010";
    ELSIF (A = "10") THEN 
	dec_out <= "0100";	
    ELSE
	dec_out <= "1000";
    END IF;

  end if;
    
end process;
end arch_dec2_4;

