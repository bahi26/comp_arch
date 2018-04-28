library ieee;
use ieee.std_logic_1164.all;
entity forward_unit_mem is
	port(mem_out:in std_logic_vector(2 downto 0);
	     rd:in std_logic_vector(2 downto 0);
	     f:out std_logic);
end entity forward_unit_mem;
architecture forward_unit_arch of forward_unit_mem is
begin
	f<='1' when(mem_out=rd)
	else '0';
end forward_unit_arch;