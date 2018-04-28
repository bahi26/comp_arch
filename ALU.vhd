library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity alu is
	port(source,destination:in std_logic_vector(15 downto 0);
	     operation :in std_logic_vector(4 downto 0);
	     flags_input:in std_logic_vector(3 downto 0);
	     flags_output:out std_logic_vector(3 downto 0);
	     output:out std_logic_vector(31 downto 0));
end entity alu;

architecture alu_arch of alu is
signal check :std_logic_vector(16 downto 0);
begin
	process(source,destination,operation)
	variable result : std_logic_vector(31 downto 0):=(others=>'0');
	variable flags : std_logic_vector(3 downto 0);
	begin
	result:=(others=>'0');
	flags:=flags_input;
	if (operation="00001")then--move
		result:="0000000000000000"&source;
	elsif (operation="00010") then--add
		result:="000000000000000" & std_logic_vector(to_unsigned(to_integer(signed(source)) + to_integer(signed(destination)),check'length));
		if(result(15 downto 0)="0000000000000000") then
			flags(0):='1';
		else 
			flags(0):='0';
		end if;
		flags(1):=result(15);
		flags(2):=result(16);
		--result(16):='0';
	elsif (operation="00011") then--mul
		result:=std_logic_vector(to_unsigned(to_integer(signed(source)) * to_integer(signed(destination)),result'length));
	elsif (operation="00100") then--sub
		result:="000000000000000" & std_logic_vector(to_unsigned(to_integer(signed(source)) - to_integer(signed(destination)),check'length));
		if(result(15 downto 0)="0000000000000000") then
			flags(0):='1';
		else 
			flags(0):='0';
		end if;
		flags(1):=result(15);
		flags(2):=result(16);
		--result(16):='0';
	elsif(operation="00101")then--and
		result:="0000000000000000"&(source and destination);
		flags(1):=result(15);
	elsif(operation="00110")then--or
		result:="0000000000000000"&(source or destination);
		flags(1):=result(15);
		flags(2):=result(16);
	elsif(operation="00111")then--rlc
		result:="0000000000000000"&(source(14 downto 0)& flags(2));
	elsif(operation="01000")then--rrc
		result:="0000000000000000"&(flags(2)&source(15 downto 1));
	elsif (operation="01001") then--shl
		result:="0000000000000000" & std_logic_vector(shift_left(signed(source),  to_integer(signed(destination))));
		if(result(15 downto 0)="0000000000000000") then
			flags(0):='1';
		else 
			flags(0):='0';
		end if;
		flags(1):=result(15);
		flags(2):=result(16);
		result(16):='0';
	elsif (operation="01010") then--shr
		result:="0000000000000000" & std_logic_vector(shift_right(signed(source),  to_integer(signed(destination))));
		if(result(15 downto 0)="0000000000000000") then
			flags(0):='1';
		else 
			flags(0):='0';
		end if;
		flags(1):=result(15);
		result(16):='0';
	elsif(operation="01011")then --setc
		flags(2):='1';
	elsif(operation="01100")then --clrc
		flags(2):='0';
	elsif (operation="01101") then--push
		result:="000000000000000" & std_logic_vector(to_unsigned(to_integer(signed(source)) - 1,check'length));
	elsif (operation="01110") then--ppop
		result:="000000000000000" & std_logic_vector(to_unsigned(to_integer(signed(source)) + 1,check'length));
	elsif(operation="10001")then --not
		result:="0000000000000000"&NOT(source);
		flags(1):=result(15);
		if(result(15 downto 0)="0000000000000000") then
			flags(0):='1';
		else 
			flags(0):='0';
		end if;
		flags(1):=result(15);
	elsif (operation="10010") then--inc
		result:="000000000000000" & std_logic_vector(to_unsigned(to_integer(signed(source)) + 1,check'length));
		if(result(15 downto 0)="0000000000000000") then
			flags(0):='1';
		else 
			flags(0):='0';
		end if;
		flags(1):=result(15);
		flags(2):=result(16);
		result(16):='0';
	elsif (operation="10011") then--dec
		result:="000000000000000" & std_logic_vector(to_unsigned(to_integer(signed(source)) - 1,check'length));
		if(result(15 downto 0)="0000000000000000") then
			flags(0):='1';
		else 
			flags(0):='0';
		end if;
		flags(1):=result(15);
		flags(2):=result(16);
		result(16):='0';
	elsif(operation="10100")then --jz
		flags(0):='1';
	elsif(operation="10101")then --jn
		flags(1):='1';
	elsif(operation="10110")then --jc
		flags(2):='1';
	elsif(operation="11000")then--call
		result:="000000000000000" & std_logic_vector(to_unsigned(to_integer(signed(source)) - 1,check'length));
	elsif(operation="11001")then--ret
		result:="000000000000000" & std_logic_vector(to_unsigned(to_integer(signed(source)) + 1,check'length));
	elsif(operation="11010")then--call
		result:="000000000000000" & std_logic_vector(to_unsigned(to_integer(signed(source)) + 1,check'length));
	elsif(operation="11111")then--interrupt
		result:="000000000000000" & std_logic_vector(to_unsigned(to_integer(signed(source)) - 1,check'length));
	else
		result:=(others=>'0');
	end if;
	flags_output<=flags;
	output<=result;
	end process;
end alu_arch;