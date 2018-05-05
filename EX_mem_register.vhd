library ieee;
use ieee.std_logic_1164.all;
entity ex_mem_reg is
	port(datain:in std_logic_vector(101 downto 0);
	     clk,rst:in std_logic;
	     dataout:out std_logic_vector(101 downto 0));
end entity ex_mem_reg;

architecture ex_mem_arch of ex_mem_reg is
begin	
	process(clk,rst)
	begin
		if(rst='1')then
			dataout<=(others=>'0');
		elsif falling_edge(clk)then
			dataout<=datain;
		end if;
	end process;
end ex_mem_arch;
