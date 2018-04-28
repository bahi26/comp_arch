library ieee;
use ieee.std_logic_1164.all;
entity mux3_3 is
	port(data_in:in std_logic_vector(15 downto 0);
	     mem_input,wb_input:in std_logic_vector(31 downto 0);
	     f:in std_logic_vector(2 downto 0);
	     output:out std_logic_vector(15 downto 0));
end entity mux3_3;
architecture mux_arch of mux3_3 is
begin
	output<=mem_input(15 downto 0) when(f="001")
	else    wb_input (15 downto 0) when(f="011")
	else    mem_input(15 downto 0) when(f="100")
	else    wb_input (15 downto 0) when(f="101")
	else data_in;
end mux_arch;
