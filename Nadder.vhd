-- gehad File

library ieee;
use ieee.std_logic_1164.all;

entity Nadder is
   generic (n : integer :=16);
port(
      FirstOperand,SecondOperand : in std_logic_vector(n-1 downto 0);
      cin : in std_logic;
      Result_Nadder : out std_logic_vector(n-1 downto 0);
      cout : out std_logic
      );
end Nadder;

architecture arch_Nadder of Nadder is
  component adder is
     port(
      in1,in2,cn:in std_logic;
      s1,cot :out std_logic
     );
   end component;

 signal temp :std_logic_vector(n-1 downto 0);
 
 begin
 loop1: for i in 0 to n-1 generate 
        g0: if i=0 generate
              f0: adder port map (FirstOperand(i), SecondOperand(i),cin,Result_Nadder(i),temp(i));
          end generate g0;
        gx: if i>0 generate 
            fx: adder port map (FirstOperand(i),SecondOperand(i),temp(i-1),Result_Nadder(i),temp(i));
        end generate gx;
    end generate;
   cout <= temp(n-1);
  end arch_Nadder;
