
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;
USE ieee.std_logic_unsigned.all;

ENTITY ram IS
	PORT(
		clk : IN std_logic;
		we,en  : IN std_logic;
		address : IN  std_logic_vector(9 DOWNTO 0);
		datain  : IN  std_logic_vector(15 DOWNTO 0);
		dataout : OUT std_logic_vector(15 DOWNTO 0));
END ENTITY ram;

ARCHITECTURE syncrama OF ram IS

	TYPE ram_type IS ARRAY(0 TO 1023) OF std_logic_vector(15 DOWNTO 0);
	SIGNAL ram : ram_type 	:= (
   0     => "0000000000000000",
   1     => X"0002",
   2     => X"0002",
   3     => X"0003",
   4     => X"0004",
  OTHERS => X"00FF"
);

	
	BEGIN
		PROCESS(clk,we,en) IS
			BEGIN
			IF en='1' then
				IF rising_edge(clk) THEN  
					IF we = '1' THEN
						ram(to_integer(unsigned(address))) <= datain(15 downto 0);
					END IF;
				END IF;
					dataout <= ram(to_integer(unsigned(address))) ;
					
				
			END IF;
		END PROCESS;
		
END syncrama;



