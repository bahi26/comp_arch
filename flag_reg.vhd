library ieee;
use ieee.std_logic_1164.all;
entity flag_register is
	port(alu_out,mem_wb:in std_logic_vector(3 downto 0);
	     en,rst,clk:in std_logic;
	     output:out std_logic_vector(3 downto 0));
end entity flag_register;

architecture flag_arch of flag_register is
begin	
	process(clk,rst)
	begin
		if(rst='1')then
			output<="0000";
		elsif falling_edge(clk) then
			if(en='1')then
				output<=mem_wb;
			else 
				output<=alu_out;
			end if;
		end if;
	end process;
end flag_arch;