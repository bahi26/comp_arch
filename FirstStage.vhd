-- gehad File

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY FirstStage IS
port(
   en_PC,Rst_PC ,InstMem_en ,Clk_FirstStage :in std_logic;
   data , d1 , M0 ,M1 : in std_logic_vector(9 downto 0);
   PC_Sel : in std_logic_vector(2 downto 0);
   Inst_OutFirstStage :out std_logic_vector(15 downto 0);
   PC_IncrOut : out std_logic_vector(9 downto 0)
);
end FirstStage;

architecture arch_FirstStage of FirstStage is 

component reg is
     GENERIC ( n : integer := 16);
     PORT( Clk_reg ,Rst_reg ,en_reg: IN std_logic;
      dataIn_reg : IN std_logic_vector(n-1 DOWNTO 0);
      dataOut_reg : OUT std_logic_vector(n-1 DOWNTO 0));
   end component;

component Nadder is
   generic (n : integer :=16);
   port(
      FirstOperand,SecondOperand : in std_logic_vector(n-1 downto 0);
      cin : in std_logic;
      Result_Nadder : out std_logic_vector(n-1 downto 0);
      cout : out std_logic
      );
   end component;

component mux3_1 is
   GENERIC ( n : integer := 16);
   PORT (IN1,IN2,IN3,IN4,IN5 : IN std_logic_vector(9 downto 0);
            SEl	:  IN std_logic_vector(2 downto 0);
            OUT1 : OUT  std_logic_vector(9 downto 0));
   end component;

component InstMem is
   PORT (  Clk_InstMem : IN std_logic;
           Mem_en : IN std_logic;
	   address_InstMem : IN std_logic_vector(9 DOWNTO 0);
	   dataout_InstMem : OUT std_logic_vector(15 DOWNTO 0) );
   end component;

signal newVal_PC : std_logic_vector(9 downto 0);
signal CurrentVal_PC : std_logic_vector(9 downto 0);
signal FirstOp_PCadder : std_logic_vector(9 downto 0);
signal PC_Incremented : std_logic_vector(9 downto 0);
signal Current_Inst : std_logic_vector(15 downto 0);
signal Cout_AdderPC : std_logic;

begin
   FirstOp_PCadder <= "0000000001";

   PC: reg GENERIC MAP (n=>10) PORT MAP (Clk_FirstStage , Rst_PC ,en_PC ,newVal_PC,CurrentVal_PC);
   Adder_PC : Nadder GENERIC MAP (n=>10) PORT MAP(FirstOp_PCadder,CurrentVal_PC, '0' ,PC_Incremented ,Cout_AdderPC);
   Mux_PC : mux3_1 GENERIC MAP (n=>10) PORT MAP(data,PC_Incremented,d1,M0,M1,PC_Sel,newVal_PC);
   INST_Mem : InstMem PORT MAP (Clk_FirstStage , InstMem_en , CurrentVal_PC ,Current_Inst);

   Inst_OutFirstStage <= Current_Inst;
   --PC_IncrOut <= PC_Incremented;
     PC_IncrOut <= CurrentVal_PC;
end arch_FirstStage;
