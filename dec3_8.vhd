library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dec3_8 is
    Port ( A  : in  STD_LOGIC_VECTOR (2 downto 0); 
           dec_out  : out STD_LOGIC_VECTOR (7 downto 0);  
           EN : in  STD_LOGIC);                     
end dec3_8;

architecture arch_dec3_8 of dec3_8 is
begin
process (A, EN)
begin
    
 If en ='1' then
    IF(A = "000") THEN  
        dec_out <= "00000001" ;
    ELSIF (A = "001") THEN 
	dec_out <= "00000010";
    ELSIF (A = "010") THEN 
	dec_out <= "00000100";	
    ELSIF (A = "011") THEN
	dec_out <= "00001000";
    ELSIF (A = "100") THEN
	dec_out <= "00010000";
    ELSIF (A = "101") THEN
	dec_out <= "00100000";
    ELSIF (A = "110") THEN
	dec_out <= "01000000";
    ELSE 
        dec_out <= "10000000";
    END IF;
  
   ELSE
       dec_out <= "00000000";
   end if;
end process;
end arch_dec3_8;
