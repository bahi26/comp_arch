-- gehad File

library ieee;
use ieee.std_logic_1164.all;

entity adder is
port(
   in1,in2,cn:in std_logic;
   s1,cot:out std_logic
);
end adder;

architecture arch_adder of adder is
begin
     s1 <= in1 xor in2 xor cn;
     cot <= (in1 and in2) or (cn and (in1 xor in2));
end arch_adder;