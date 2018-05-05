-- Team File

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

entity processor is
 PORT ( 
         processor_Clk: IN std_logic;
         processor_Rst: IN std_logic;
    
         -- from ID_EX to IF_ID
           ID_EX_S12 : in std_logic;
        
         -- from EX_MEM to IF_ID
           EX_MEM_S12 : in std_logic;
        
         -- from MEM_WB to IF_ID
           MEM_WB_S12 : in std_logic;
        
        -- from Ex_stage to IF_ID
           flag_Reg : in std_logic_vector(3 downto 0); 

         --from control 
           --to FirstStage
         enable_PC : in std_logic;
         reset_PC : in std_logic;
         selection_PC : in std_logic_vector(2 downto 0);
         enable_InstMem : in std_logic;
           --
         
           --to ID_IF
         enable_IF_ID :in std_logic;
         Reset_IF_ID : IN std_logic;
         
         is_call : in std_logic;
         is_jmp :  in std_logic;
         is_jz :  in std_logic;
         is_jn : in std_logic;
         is_jc : in std_logic;


           --
      
         -- to SecondStage
   
         WriteSrcDst_enable : in std_logic_vector(1 downto 0);
         --WB_en_MultOp : in std_logic;
         --WB_en_decoder :in std_logic;
         
         readEn_SP :in std_logic; -- S8 in drawing 
         WriteEn_SP :in std_logic; 
         sel_LoadOrStore :in std_logic;
         
         --

         -- to ID_EX

         EX_Control :in std_logic_vector(4 downto 0);
         MEM_Control :in std_logic_vector(5 downto 0);
         WB_Control :in std_logic;

        s12_ID_EX : in std_logic;
        s13_ID_EX : in std_logic_vector(1 downto 0);
        w_r_En_ID_EX : in std_logic;
        flag_enable :in std_logic;
      
         ID_EX_en :in std_logic;
         ID_EX_Rst : IN std_logic;
  
         -----------------

         --from other stages to FirstStage
         IN_data : in std_logic_vector(9 downto 0);
         IN_d1 : in std_logic_vector(9 downto 0);
         IN_M0 : in std_logic_vector(9 downto 0);
         IN_M1 : in std_logic_vector(9 downto 0);
         -------------------

         -- From Mem_WB (Until writen inside the arch) -- will be removed from here
         Rdest_Mem_WB : in std_logic_vector(5 downto 0);
         -- From WB stage
         WriteData_Mem_WB:in std_logic_vector(31 downto 0)
      );    
 END ENTITY processor;

architecture arch_processor of processor is

 component FirstStage is
     port(
           en_PC,Rst_PC, InstMem_en ,Clk_FirstStage :in std_logic;
           data , d1 , M0 ,M1 : in std_logic_vector(9 downto 0);
           PC_Sel : in std_logic_vector(2 downto 0);
           Inst_OutFirstStage :out std_logic_vector(15 downto 0);
           PC_IncrOut : out std_logic_vector(9 downto 0)
         );
   end component;
 
 component IF_ID is
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

   end component;

  component SecondStage is
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
 
  end component;

  component ID_EX is
   port(
         Clk_ID_EX :in std_logic;
      
         -- From SecondStage
         PC_Incr : in std_logic_vector(9 downto 0);
         FirstOperand_data  : in std_logic_vector(15 downto 0);
         SecondOperand_data : in std_logic_vector(15 downto 0);
         SrcDes_WB : in std_logic_vector(5 downto 0);
        
        -- From control
        Control_EX :in std_logic_vector(4 downto 0);
        Control_MEM :in std_logic_vector(5 downto 0);
        Control_WB :in std_logic;
        s12 : in std_logic;
        s13 : in std_logic_vector(1 downto 0);
        w_r_En : in std_logic;
        flag_en : in std_logic;
    
        en_ID_EX :in std_logic;
        Rst_ID_EX : IN std_logic;
        --------------------
   
        ID_EX_regOut : out std_logic_vector(64 downto 0)
   
   );
 
  end component;

  	
  component ex_mem_reg is
    port(datain:in std_logic_vector(101 downto 0);
	     clk,rst:in std_logic;
	     dataout:out std_logic_vector(101 downto 0));
   end component;

    component ex_stage is
	port(ID_EX_Content:in std_logic_vector(65 downto 0);
	     mem_output,wb_output:in std_logic_vector(31 downto 0);
	     mem_flag:in std_logic_vector(3 downto 0);
	     rsd_mem,rsd_wb:in std_logic_vector(5 downto 0);
	     s13_mem,s13_wb:in std_logic_vector(1 downto 0);
	     clk,rst,flag_en,msp,wsp:in std_logic;
	     dataout:out std_logic_vector(101 downto 0));
   end component;

   component MEM_Stage is
    port(
       EX_MEM_Content: in std_logic_vector(101 downto 0);
       FromWB: in std_logic_vector(18 downto 0);
       clk: in std_logic;
       MEM_Stage_Output: out std_logic_vector(64 downto 0));

   end component;

   component MEM_WB is
    port(
       MEMStage_Output: in std_logic_vector(64 downto 0);
       clk,rst: in std_logic;
       MEM_WB_Content: out std_logic_vector(64 downto 0));
   end component;

  
     component WB_Stage is
    port(
        MEM_WB_Content: in std_logic_vector(64 downto 0);
        clk: in std_logic;
        WB_StageOutput: out std_logic_vector(43 downto 0));

   end component;


   --out from FirstStage to IF_ID
   signal Inst_FirstStageToIF_ID : std_logic_vector(15 downto 0);
   signal PC_IncrFirstStageToIF_ID :  std_logic_vector(9 downto 0);
   -----------------
   
   --out from IF_ID
   signal IF_ID_Content : std_logic_vector(25 downto 0);
   
   --out from SecondStage
   signal out_Read_data1_SecondStage : std_logic_vector(15 downto 0);
   signal out_Read_data2_SecondStage : std_logic_vector(15 downto 0);
   signal out_SrcDes_WB_SecondStage  : std_logic_vector(5 downto 0); 
   signal out_PC_IncrOut_SecondStage : std_logic_vector(9 downto 0);

   --out from ID_EX
   signal ID_EX_Content : std_logic_vector(65 downto 0);

   --out from Ex_stage
   signal Ex_Mem_in,Ex_Mem_out:std_logic_vector(101 downto 0);
   signal mem_output,wb_output:std_logic_vector(31 downto 0);
   signal mem_flag:std_logic_vector(3 downto 0);
   signal rsd_mem,rsd_wb:std_logic_vector(5 downto 0);
   signal s13_mem,s13_wb:std_logic_vector(1 downto 0);
   signal flag_en:std_logic;
   signal FWIn:std_logic_vector(18 downto 0);
   -- out from mem stage
   signal out_of_mem_stage: std_logic_vector(64 downto 0);
   -- out from MEM_WB
   signal out_of_mem_WB:std_logic_vector(64 downto 0);
   -- out from writeback
   signal out_from_WB: std_logic_vector(43 downto 0);
begin
   FWIn<=out_of_mem_WB(10 downto 8)&out_of_mem_WB(26 downto 11);
   mem_output<=Ex_Mem_out(48 downto 17);
   wb_output<=out_from_WB(37 downto 6);
   mem_flag<=out_of_mem_WB(26 downto 23);
   rsd_mem<=Ex_Mem_out(84 downto 79);
   rsd_wb<=out_from_WB(5 downto 0);
   s13_mem<=Ex_Mem_out(86 downto 85);
   s13_wb<=out_of_mem_WB(3 downto 2);
   flag_en<=out_of_mem_WB(0);
--   processor_FirstStage : FirstStage PORT MAP(enable_PC,processor_Rst,enable_InstMem,processor_Clk,IN_data,IN_d1,IN_M0,IN_M1,selection_PC,Inst_FirstStageToIF_ID,PC_IncrFirstStageToIF_ID);
--   Processor_IF_ID : IF_ID PORT MAP(Inst_FirstStageToIF_ID,PC_IncrFirstStageToIF_ID,ID_EX_S12,EX_MEM_S12,MEM_WB_S12,is_call,is_jmp,is_jz,is_jn,is_jc,flag_Reg(3),flag_Reg(2),flag_Reg(1),processor_Clk,enable_IF_ID ,processor_Rst,IF_ID_Content);
--   processor_SecondStage : SecondStage PORT MAP (processor_Clk , IF_ID_Content(25 downto 10) , IF_ID_Content(9 downto 0),Rdest_Mem_WB,WriteData_Mem_WB,WriteSrcDst_enable,readEn_SP,WriteEn_SP,processor_Rst ,processor_Rst ,processor_Rst,processor_Rst,processor_Rst,processor_Rst,sel_LoadOrStore,out_Read_data1_SecondStage,out_Read_data2_SecondStage,out_SrcDes_WB_SecondStage,out_PC_IncrOut_SecondStage);
--   Processor_ID_EX : ID_EX PORT MAP(processor_Clk,out_PC_IncrOut_SecondStage,out_Read_data1_SecondStage,out_Read_data2_SecondStage,out_SrcDes_WB_SecondStage,EX_Control,MEM_Control,WB_Control,s12_ID_EX,s13_ID_EX,w_r_En_ID_EX,flag_enable,ID_EX_en,processor_Rst,ID_EX_Content);
   Processor_Execution_Stage:ex_stage port map(ID_EX_Content,mem_output,wb_output,mem_flag,rsd_mem,rsd_wb,s13_mem,s13_wb,processor_Clk,processor_Rst,flag_en,Ex_Mem_out(96),out_from_WB(38),Ex_Mem_in);
   Processor_EX_MEM:ex_mem_reg port map(Ex_Mem_in,Processor_Clk,Processor_Rst,Ex_Mem_out);
   Processor_MEM_Stage: MEM_Stage port map(Ex_Mem_out,FWIn,Processor_Clk,out_of_mem_stage);
   Processor_MEM_WB: MEM_WB port map (out_of_mem_stage,Processor_Clk,Processor_Rst,out_of_mem_WB);
   Processor_WB_Stage: WB_Stage port map (out_of_mem_WB,Processor_Clk,out_from_WB);
end arch_processor;


