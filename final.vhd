

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;
USE ieee.std_logic_unsigned.all;
entity WB_Stage is
 port(
 MEM_WB_Content: in std_logic_vector(58 downto 0);
 clk: in std_logic;
 WB_StageOutput: out std_logic_vector(37 downto 0));
end entity WB_Stage;


architecture arch_WB_Stage of WB_Stage is


component mux is
		GENERIC ( n : integer := 16);
		PORT (IN1,IN2 : in std_logic_vector( n-1 downto 0);
		     S :  IN std_logic;
  		     OUT1 : OUT  std_logic_vector( n-1 downto 0));     
END component;



signal Data2_InMux:std_logic_vector(31 downto 0);

signal Data_out: std_logic_vector(31 downto 0);

begin

Data2_InMux<=("0000000000000000"&MEM_WB_Content(26 downto 11));
muxForWB: mux generic map (n=>32) port map (MEM_WB_Content(58 downto 27),Data2_InMux,MEM_WB_Content(1),Data_out);
WB_StageOutput<=Data_out&MEM_WB_Content(10 downto 5);


end arch_WB_Stage;