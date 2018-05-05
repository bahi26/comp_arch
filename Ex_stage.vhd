library ieee;
use ieee.std_logic_1164.all;
entity ex_stage is
	port(ID_EX_Content:in std_logic_vector(64 downto 0);
	     mem_output,wb_output:in std_logic_vector(31 downto 0);
	     mem_flag:in std_logic_vector(3 downto 0);
	     rsd_mem,rsd_wb:in std_logic_vector(5 downto 0);
	     s13_mem,s13_wb:in std_logic_vector(1 downto 0);
	     clk,rst,flag_en:in std_logic;
	     dataout:out std_logic_vector(95 downto 0));
end entity ex_stage;
architecture ex_stage_arch of ex_stage is
component alu is
    port(source,destination:in std_logic_vector(15 downto 0);
	     operation :in std_logic_vector(4 downto 0);
	     flags_input:in std_logic_vector(3 downto 0);
	     flags_output:out std_logic_vector(3 downto 0);
	     output:out std_logic_vector(31 downto 0));
   end component;

  component forward_unit is
    port(mem_input,wb_input:in std_logic_vector(5 downto 0);
	     s13_mem,s13_wb:in std_logic_vector(1 downto 0);
	     rs,rd:in std_logic_vector(2 downto 0);
	     f1,f2:out std_logic_vector(2 downto 0));
   end component;

  component flag_register is
    port(alu_out,mem_wb:in std_logic_vector(3 downto 0);
	     en,rst,clk:in std_logic;
	     output:out std_logic_vector(3 downto 0));
   end component;
  component mux3_3 is
	port(data_in:in std_logic_vector(15 downto 0);
	     mem_input,wb_input:in std_logic_vector(31 downto 0);
	     f:in std_logic_vector(2 downto 0);
	     output:out std_logic_vector(15 downto 0));
   end component;
signal alu_output:std_logic_vector(31 downto 0);
signal src,dst:std_logic_vector(15 downto 0);
signal f2,f1:std_logic_vector(2 downto 0);
signal alu_flag_out,flag_output:std_logic_vector(3 downto 0);
begin

mux1:mux3_3 port map(ID_EX_Content(47 downto 32),mem_output,wb_output,f2,src);
mux2:mux3_3 port map(ID_EX_Content(31 downto 16),mem_output,wb_output,f1,dst);
flag_reg:flag_register port map(alu_flag_out,mem_flag,flag_en,rst,clk,flag_output);
execute:alu port map(src,dst,ID_EX_Content(64 downto 60),flag_output,alu_flag_out,alu_output);
forward_data:forward_unit port map(rsd_mem,rsd_wb,s13_mem,s13_wb,ID_EX_Content(5 downto 3),ID_EX_Content(2 downto 0),f1,f2);
dataout<=ID_EX_Content(51)&ID_EX_Content(53)&ID_EX_Content(55 downto 54)&ID_EX_Content(57 downto 56)&ID_EX_Content(58)&ID_EX_Content(50)&ID_EX_Content(52)&ID_EX_Content(49 downto 48)&ID_EX_Content(5 downto 0)&flag_output&ID_EX_Content(15 downto 6)&src&alu_output&dst&ID_EX_Content(59);
end ex_stage_arch;