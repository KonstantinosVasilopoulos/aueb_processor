library ieee;
use ieee.std_logic_1164.all;

entity NOT_FULL_16bit is
port(in1: in std_logic_vector(15 downto 0);
	out1: out std_logic_vector(15 downto 0));
end NOT_FULL_16bit;

architecture NotFull16BitLogic of NOT_FULL_16bit is
	component NOT_gate is
	port(in1: in std_logic;
		out1: out std_logic);
	end component NOT_gate;
begin
	and_loop: for i in 15 downto 0 generate
		NOTF160: NOT_gate port map(in1(i), out1(i));
	end generate and_loop;
end NotFull16BitLogic;