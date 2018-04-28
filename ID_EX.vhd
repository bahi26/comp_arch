-- gehad File

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

entity ID_EX is
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
end ID_EX;

architecture arch_ID_EX of ID_EX is

component reg_latch is
     GENERIC ( n : integer := 16);
PORT( Clk_reg_latch , en_reg_latch, Rst_reg_latch : IN std_logic;
      dataIn_reg_latch : IN std_logic_vector(n-1 DOWNTO 0);
      dataOut_reg_latch : OUT std_logic_vector(n-1 DOWNTO 0));
end component;

signal input_ID_EX : std_logic_vector(64 downto 0);

begin
   
   input_ID_EX(64) <= flag_en;
   input_ID_EX(63) <= s12;
   input_ID_EX(62 downto 61) <= s13;
   input_ID_EX(60) <= w_r_En;
   input_ID_EX(59 downto 55) <= Control_EX;
   input_ID_EX(54 downto 49) <= Control_MEM;
   input_ID_EX(48) <= Control_WB;
   input_ID_EX(47 downto 32) <= FirstOperand_data;
   input_ID_EX(31 downto 16) <= SecondOperand_data;
   input_ID_EX(15 downto 6) <= PC_Incr;
   input_ID_EX(5 downto 0) <= SrcDes_WB;

   ID_EX_reg : reg_latch GENERIC MAP (n=>65) PORT MAP (Clk_ID_EX , en_ID_EX ,Rst_ID_EX ,input_ID_EX,ID_EX_regOut);

end arch_ID_EX;