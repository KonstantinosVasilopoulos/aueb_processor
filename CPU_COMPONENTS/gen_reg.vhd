library ieee;
use ieee.std_logic_1164.all;

entity gen_reg is
generic (n : integer := 16);
port (in1 : in std_logic_vector(n-1 downto 0); 
	clock, enable : in std_logic;
	out1 : out std_logic_vector(n-1 downto 0));
end gen_reg;

architecture RegLogic of gen_reg is
	component REG_1bit is
		port (in1, clock, enable : in std_logic;
			out1 : out std_logic);
	end component REG_1bit;

begin 
	reg_loop : for i in n-1 downto 0 generate 
		REG0 : REG_1bit port map(in1(i), clock, enable, out1(i));
	end generate reg_loop;
end RegLogic;