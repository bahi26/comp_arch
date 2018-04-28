-- gehad File
-- This Instruction memory reads data (PC value) in rising_edge

library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;
ENTITY InstMem IS
 PORT (  Clk_InstMem : IN std_logic;
           Mem_en : IN std_logic;
	   address_InstMem : IN std_logic_vector(9 DOWNTO 0);
	   dataout_InstMem : OUT std_logic_vector(15 DOWNTO 0) );
END ENTITY InstMem;

architecture arch_InstMem of InstMem is 
TYPE Inst_ram_type IS ARRAY(0 TO 1024) of std_logic_vector(15 DOWNTO 0);
     -- edit to read from the file
     SIGNAL Inst_ram : Inst_ram_type:= ( "0000000000000000", "0000000000000001" , "0000000000000010" ,"0000000000000011","0000000000000100","0000000000000101","0000000000000110","0000000000000111","0000000000001000","0000000000001001",others => (others=>'1'));
BEGIN 
    process (Clk_InstMem,Mem_en) is
    begin
    if rising_edge(Clk_InstMem) and Mem_en='1' then 
    dataout_InstMem <= Inst_ram(to_integer(unsigned((address_InstMem))));
    end if;
    end process;

END arch_InstMem;
