-- gehad File

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

entity IF_ID is
  port(
           --from FirstStage
           Current_Inst :in std_logic_vector(15 downto 0);
           PC_Incr : in std_logic_vector(9 downto 0);
           -----------------
          
           --from ID_EX
           s12_ID_EX : in std_logic;

           --from EX_MEM
           s12_EX_MEM : in std_logic;
 
           --from MEM_WB
           s12_MEM_WB : in std_logic;
                     
           --from control 
           Is_call : in std_logic;
           Is_jmp :  in std_logic;
           Is_jz :  in std_logic;
           Is_jn : in std_logic;
           Is_jc : in std_logic;

           --from flags
           Zf : in std_logic;
           Nf : in std_logic;
           Cf : in std_logic;
            
           ---------------

           Clk_IF_ID :in std_logic;
           en_IF_ID :in std_logic;
           Rst_IF_ID : IN std_logic;
          

          IF_ID_regOut : out std_logic_vector(25 downto 0)
   );
end IF_ID;

architecture arch_IF_ID of IF_ID is

component reg_latch is
     GENERIC ( n : integer := 16);
PORT( Clk_reg_latch , en_reg_latch, Rst_reg_latch : IN std_logic;
      dataIn_reg_latch : IN std_logic_vector(n-1 DOWNTO 0);
      dataOut_reg_latch : OUT std_logic_vector(n-1 DOWNTO 0));
end component;

component reg is
     GENERIC ( n : integer := 16);
     PORT( Clk_reg ,Rst_reg ,en_reg: IN std_logic;
      dataIn_reg : IN std_logic_vector(n-1 DOWNTO 0);
      dataOut_reg : OUT std_logic_vector(n-1 DOWNTO 0));
end component;

component mux2_1 is
     GENERIC ( n : integer := 16);
     PORT (IN1,IN2 : in std_logic_vector(n-1 downto 0);
            SEl	:  IN std_logic;
            OUT1        : OUT  std_logic_vector(n-1 downto 0)); 
end component;

signal sel_mux : std_logic;
signal Zero_Inst : std_logic_vector(15 downto 0);
signal passed_Inst : std_logic_vector(15 downto 0);
signal input_stage_reg : std_logic_vector(25 downto 0);
signal return_signal_OrS12 : std_logic;  
signal IR_select : std_logic;

begin
  
  return_signal_OrS12 <= s12_ID_EX or s12_ID_EX or s12_MEM_WB;
  IR_select <= Is_call or Is_jmp or return_signal_OrS12 or (Is_Jz and Zf) or (Is_Jn and Nf) or (Is_Jc and Cf);
  
  sel_mux <= IR_select;
  Zero_Inst <= (others => '0');
  
  input_stage_reg(25 downto 10) <= passed_Inst;
  input_stage_reg(9 downto 0) <= PC_Incr;
 
  Mux_Inst : mux2_1 GENERIC MAP (n=>16) PORT MAP (Current_Inst,Zero_Inst,sel_mux,passed_Inst);
  IF_ID_reg : reg_latch GENERIC MAP (n=>26) PORT MAP (Clk_IF_ID , en_IF_ID ,Rst_IF_ID ,input_stage_reg,IF_ID_regOut);


end arch_IF_ID;
