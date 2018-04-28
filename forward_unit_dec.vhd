library ieee;
use ieee.std_logic_1164.all;
entity forward_unit_dec is
	port(mem_input,wb_input:in std_logic_vector(5 downto 0);
	     s13_mem,s13_wb:in std_logic_vector(1 downto 0);
	     rs:in std_logic_vector(2 downto 0);
	     f:out std_logic_vector(2 downto 0));
end entity forward_unit_dec;
architecture forward_unit_arch of forward_unit_dec is
begin
	f  <="001" when(mem_input(5 downto 3)=rs and s13_mem(1)='1')
	else "100" when(mem_input(2 downto 0)=rs and s13_mem(0)='1')
	else "011" when(wb_input(5 downto 3)=rs and s13_wb(1)='1')
	else "101" when(wb_input(2 downto 0)=rs and s13_wb(0)='1')
	else "000";
end forward_unit_arch;