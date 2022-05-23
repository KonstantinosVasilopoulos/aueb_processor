-- Konstantinos Vasilopoulos 3180018
-- Efthymios Papageorgiou 3180144

library ieee;
use ieee.std_logic_1164.all;

entity reg is
generic (n : integer := 16);
port (in1 : in std_logic_vector(n-1 downto 0); 
	clock, enable : in std_logic;
	out1 : out std_logic_vector(n-1 downto 0));
end reg;

architecture RegLogic of reg is
	component REG_1bit is
		port (in1, clock, enable : in std_logic;
			out1 : out std_logic);
	end component REG_1bit;

begin 
	--reg_loop : for i in n-1 downto 0 generate 
		--REG0 : REG_1bit port map(in1(i), clock, enable, out1(i));
	--end generate reg_loop;
	G0: REG_1bit port map(in1(0), clock, enable, out1(0));
	G1: REG_1bit port map(in1(1), clock, enable, out1(1));
	G2: REG_1bit port map(in1(2), clock, enable, out1(2));
	G3: REG_1bit port map(in1(3), clock, enable, out1(3));
	G4: REG_1bit port map(in1(4), clock, enable, out1(4));
	G5: REG_1bit port map(in1(5), clock, enable, out1(5));
	G6: REG_1bit port map(in1(6), clock, enable, out1(6));
	G7: REG_1bit port map(in1(7), clock, enable, out1(7));
	G8: REG_1bit port map(in1(8), clock, enable, out1(8));
	G9: REG_1bit port map(in1(9), clock, enable, out1(9));
	G10: REG_1bit port map(in1(10), clock, enable, out1(10));
	G11: REG_1bit port map(in1(11), clock, enable, out1(11));
	G12: REG_1bit port map(in1(12), clock, enable, out1(12));
	G13: REG_1bit port map(in1(13), clock, enable, out1(13));
	G14: REG_1bit port map(in1(14), clock, enable, out1(14));
	G15: REG_1bit port map(in1(15), clock, enable, out1(15));
end RegLogic;