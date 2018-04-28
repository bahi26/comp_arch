-- gehad File

library ieee;
use ieee.std_logic_1164.all;

entity SecondStage is
port(
        Clk_SecondStage : in std_logic;
        
        -- From IF_ID
        Instr_SecondStage :  in std_logic_vector(15 downto 0);
        PCinc_IF_ID :  in std_logic_vector(9 downto 0);
        
        -------------
   
        -- From Mem_WB
        Mem_WB_Rdest : in std_logic_vector(5 downto 0);
        Write_data : in std_logic_vector(31 downto 0);
        WriteSrcDst_en :in std_logic_vector(1 downto 0);   -- S13 in drawing 
                                                        -- S13[0] --> enable WriteSrcDec 
                                                        -- S13[1] --> enable WriteDstDec
        --------------
       
      
        -- from control
        --WB_en_MultOperation : in std_logic;
        --WB_en :in std_logic;
  
        
        SP_readEn :in std_logic; -- S8 in drawing 
        SP_WriteEn :in std_logic; 
        Rst_Reg0 ,Rst_Reg1 ,Rst_Reg2,Rst_Reg3,Rst_Reg4,Rst_SP :in std_logic;
        LoadOrStore_sel :in std_logic;
        -------------------------
   
        Read_data1_SecondStage : out std_logic_vector(15 downto 0); --Out of Mux2_1 load or store in drawing
        Read_data2_SecondStage : out std_logic_vector(15 downto 0);
        SrcDes_WB_SecondStage  : out std_logic_vector(5 downto 0); 
        PC_IncrOut_SecondStage : out std_logic_vector(9 downto 0)
);
end SecondStage;

architecture arch_SecondStage of SecondStage is
 component dec3_8 is
     Port ( A  : in  STD_LOGIC_VECTOR (2 downto 0); 
           dec_out  : out STD_LOGIC_VECTOR (7 downto 0);  
           EN : in  STD_LOGIC);
 end component;

 component reg is
      GENERIC ( n : integer:= 16);
      PORT( Clk_reg ,Rst_reg ,en_reg: IN std_logic;
      dataIn_reg : IN std_logic_vector(n-1 DOWNTO 0);
      dataOut_reg : OUT std_logic_vector(n-1 DOWNTO 0));

 end component;

 component mux2_1 is
      GENERIC ( n : integer:= 16);
      PORT (
            IN1,IN2 : in std_logic_vector(n-1 downto 0);
            SEl	:  IN std_logic;
            OUT1 : OUT  std_logic_vector(n-1 downto 0)
           );   

 end component;

 component mux3_1 is
      GENERIC ( n : integer:= 16);
      PORT (
            IN1,IN2,IN3,IN4,IN5 : IN std_logic_vector(n-1 downto 0);
            SEl	:  IN std_logic_vector(2 downto 0);
            OUT1 : OUT  std_logic_vector(n-1 downto 0)
         );    

 end component;

 component SP_reg is
 GENERIC ( n : integer := 16);
 PORT( Clk_reg ,Rst_reg ,en_reg: IN std_logic;
      dataIn_reg : IN std_logic_vector(n-1 DOWNTO 0);
      dataOut_reg : OUT std_logic_vector(n-1 DOWNTO 0));

 end component;

signal out_WriteSrcDec : std_logic_vector(7 downto 0);
signal out_WriteDstDec : std_logic_vector(7 downto 0);


signal en_Reg0 : std_logic;
signal en_Reg1 : std_logic;
signal en_Reg2 : std_logic;
signal en_Reg3 : std_logic;
signal en_Reg4 : std_logic;

signal out_Reg0 : std_logic_vector(15 downto 0);
signal out_Reg1 : std_logic_vector(15 downto 0);
signal out_Reg2 : std_logic_vector(15 downto 0);
signal out_Reg3 : std_logic_vector(15 downto 0);
signal out_Reg4 : std_logic_vector(15 downto 0);
signal out_SP : std_logic_vector(15 downto 0);

signal DataIn_R0 : std_logic_vector(15 downto 0);
signal DataIn_R1 : std_logic_vector(15 downto 0);
signal DataIn_R2 : std_logic_vector(15 downto 0);
signal DataIn_R3 : std_logic_vector(15 downto 0);
signal DataIn_R4 : std_logic_vector(15 downto 0);

signal RegMux_data1_1 : std_logic_vector(15 downto 0);
signal Srcdata : std_logic_vector(15 downto 0);
signal Imm_EA : std_logic_vector(15 downto 0);
signal Clk_Inverted : std_logic;
   
begin
 Clk_Inverted <= not(Clk_SecondStage);

 Dec_WriteSrc : dec3_8 PORT MAP(Mem_WB_Rdest(5 downto 3),out_WriteSrcDec ,WriteSrcDst_en(0));
 Dec_WriteDst : dec3_8 PORT MAP(Mem_WB_Rdest(2 downto 0),out_WriteDstDec ,WriteSrcDst_en(1));
 
 en_Reg0 <= (out_WriteSrcDec(0) or out_WriteDstDec(0)) and (not (SP_WriteEn));
 en_Reg1 <= (out_WriteSrcDec(1) or out_WriteDstDec(1)) and (not (SP_WriteEn));
 en_Reg2 <= (out_WriteSrcDec(2) or out_WriteDstDec(2)) and (not (SP_WriteEn));
 en_Reg3 <= (out_WriteSrcDec(3) or out_WriteDstDec(3)) and (not (SP_WriteEn));
 en_Reg4 <= (out_WriteSrcDec(4) or out_WriteDstDec(4)) and (not (SP_WriteEn));
 
 Imm_EA  <= "000000"&Instr_SecondStage(13 downto 4);   --edit 
 -- reg read data at falling edge so invert clock of the processor to make them read at rising edge
 
 PC_Inc : reg GENERIC MAP (n=>10) PORT MAP (Clk_Inverted ,'0' ,'1' ,PCinc_IF_ID,PC_IncrOut_SecondStage);
 
 reg0 : reg GENERIC MAP (n=>16) PORT MAP (Clk_Inverted ,Rst_Reg0 ,en_Reg0 ,DataIn_R0,out_Reg0);
 reg1 : reg GENERIC MAP (n=>16) PORT MAP (Clk_Inverted ,Rst_Reg1 ,en_Reg1 ,DataIn_R1,out_Reg1);
 reg2 : reg GENERIC MAP (n=>16) PORT MAP (Clk_Inverted ,Rst_Reg2 ,en_Reg2 ,DataIn_R2,out_Reg2);
 reg3 : reg GENERIC MAP (n=>16) PORT MAP (Clk_Inverted ,Rst_Reg3,en_Reg3  ,DataIn_R3,out_Reg3);
 reg4 : reg GENERIC MAP (n=>16) PORT MAP (Clk_Inverted ,Rst_Reg4, en_Reg4 ,DataIn_R4,out_Reg4);
 reg_SP :SP_reg GENERIC MAP (n=>16) PORT MAP (Clk_Inverted ,Rst_SP ,SP_WriteEn,Write_data(15 downto 0),out_SP);
 
 ----------------------------------------------
 Mux_ReadData1_1 : mux3_1 GENERIC MAP (n=>16) PORT MAP(out_Reg0,out_Reg1,out_Reg2,out_Reg3,out_Reg4,Instr_SecondStage(10 downto 8),RegMux_data1_1);
 Mux_ReadData1_2 : mux2_1 GENERIC MAP (n=>16) PORT MAP(RegMux_data1_1 , out_SP , SP_readEn ,Srcdata); 
 Mux_LoadOrStore : mux2_1 GENERIC MAP (n=>16) PORT MAP(Srcdata , Imm_EA , LoadOrStore_sel ,Read_data1_SecondStage); 
 
 
 Mux_ReadData2 : mux3_1 GENERIC MAP (n=>16) PORT MAP(out_Reg0,out_Reg1,out_Reg2,out_Reg3,out_Reg4,Instr_SecondStage(7 downto 5),Read_data2_SecondStage);
 
 -- dataIn to 5 general purpose registers 
 Mux_DataIn_R0 : mux2_1 GENERIC MAP (n=>16) PORT MAP(Write_data(15 downto 0) , Write_data(31 downto 16) , out_WriteSrcDec(0),DataIn_R0);
 Mux_DataIn_R1 : mux2_1 GENERIC MAP (n=>16) PORT MAP(Write_data(15 downto 0) , Write_data(31 downto 16) , out_WriteSrcDec(1),DataIn_R1);
 Mux_DataIn_R2 : mux2_1 GENERIC MAP (n=>16) PORT MAP(Write_data(15 downto 0) , Write_data(31 downto 16) , out_WriteSrcDec(2),DataIn_R2);
 Mux_DataIn_R3 : mux2_1 GENERIC MAP (n=>16) PORT MAP(Write_data(15 downto 0) , Write_data(31 downto 16) , out_WriteSrcDec(3),DataIn_R3);
 Mux_DataIn_R4 : mux2_1 GENERIC MAP (n=>16) PORT MAP(Write_data(15 downto 0) , Write_data(31 downto 16) , out_WriteSrcDec(4),DataIn_R4);

 SrcDes_WB_SecondStage <= Instr_SecondStage(10 downto 8) & Instr_SecondStage(7 downto 5);
end arch_SecondStage;