library ieee;
use ieee.std_logic_1164.all;

entity AND_16bit is
port(in1, in2: in std_logic_vector(15 downto 0);
	out1: out std_logic_vector(15 downto 0));
end AND_16bit;

architecture And16BitLogic of AND_16bit is
	component AND_gate is
	port(in1, in2: in std_logic;
		out1: out std_logic);
	end component AND_gate;
begin
	and_loop: for i in 15 downto 0 generate
		AND160: AND_gate port map(in1(i), in2(i), out1(i));
	end generate and_loop;
end And16BitLogic;