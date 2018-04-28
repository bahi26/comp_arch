
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;
USE ieee.std_logic_unsigned.all;
entity MEM_Stage is
 port(
 EX_MEM_Content: in std_logic_vector(95 downto 0);
 clk: in std_logic;
MEM_Stage_Output: out std_logic_vector(58 downto 0));

end entity MEM_Stage;


architecture arch_MEM_Stage of MEM_Stage is
component ram IS
	PORT(
		clk : IN std_logic;
		we,en  : IN std_logic;
		address : IN  std_logic_vector(9 DOWNTO 0);
		datain  : IN  std_logic_vector(15 DOWNTO 0);
		dataout : OUT std_logic_vector(15 DOWNTO 0));
end component;

component  mux4x2 IS  
		
		PORT (IN1,IN2,IN3,IN4 : in std_logic_vector( 15 downto 0);
		     S :  IN std_logic_vector(1 downto 0);
  		     OUT1 : OUT  std_logic_vector( 15 downto 0));     
END component;

component mux is
		GENERIC ( n : integer := 16);
		PORT (IN1,IN2 : in std_logic_vector( n-1 downto 0);
		     S :  IN std_logic;
  		     OUT1 : OUT  std_logic_vector( n-1 downto 0));     
END component;

component reg_latch IS
	GENERIC ( n : integer := 16);
	PORT( Clk_reg_latch , en_reg_latch, Rst_reg_latch : IN std_logic;
      dataIn_reg_latch : IN std_logic_vector(n-1 DOWNTO 0);
      dataOut_reg_latch : OUT std_logic_vector(n-1 DOWNTO 0));
END component;

signal Address: std_logic_vector(15 downto 0);
signal DataIn1:std_logic_vector(15 downto 0);
signal DataIn2:std_logic_vector(15 downto 0);

signal RamInput: std_logic_vector(15 downto 0);
signal RamOutput: std_logic_vector(15 downto 0);
Signal muxDataOut: std_logic_vector(15 downto 0);


begin
DataIn1<=("00"&EX_MEM_Content(74 downto 65)&EX_MEM_Content(78 downto 75));
DataIn2<=("000000"&EX_MEM_Content(74 downto 65));
muxForAddress: mux4x2 port map ("0000001000000000",EX_MEM_Content(64 downto 49),"0000000000000000",EX_MEM_Content(32 downto 17),EX_MEM_Content(93 downto 92),Address);
muxForDataIn:  mux4x2 port map(DataIn1,EX_MEM_Content(16 downto 1),EX_MEM_Content(64 downto 49),DataIn2,EX_MEM_Content(91 downto 90),RamInput);
DataRam: ram port map(clk,EX_MEM_Content(87),EX_MEM_Content(94),Address(9 downto 0),RamInput,RamOutput);
muxForMemStage : mux generic map(n=>16) port map (RamOutput,EX_MEM_Content(16 downto 1),EX_MEM_Content(89),muxDataOut);
MEM_Stage_Output<=EX_MEM_Content(48 downto 17)&muxDataOut&EX_MEM_Content(84 downto 79)&EX_MEM_Content(88)&EX_MEM_Content(86 downto 85)&EX_MEM_Content(95)&EX_MEM_Content(0);


end arch_MEM_Stage;