entity AND2 is 
port(x,y :in bit ;
     z :out bit);
end entity;

architecture Data of AND2 is
begin 
   z <= x and y;
end architecture;