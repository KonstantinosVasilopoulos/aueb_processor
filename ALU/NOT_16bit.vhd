library ieee;
use ieee.std_logic_1164.all;

entity NOT_16bit is
port(in1: in std_logic_vector(15 downto 0);
	out1: out std_logic_vector(15 downto 0) := (others => '0'));
end NOT_16bit;

architecture Not16BitLogic of NOT_16bit is
	component NOT_gate is
	port(in1: in std_logic;
		out1: out std_logic);
	end component NOT_gate;

	component OR_gate is
	port(in1, in2: in std_logic;
		out1: out std_logic);
	end component OR_gate;

	signal or_result, not_result: std_logic_vector(13 downto 0);
	signal last_or_result: std_logic;
begin
	NOT160: OR_gate port map(in1(15), in1(14), or_result(13));
	NOT161: NOT_gate port map(or_result(13), not_result(13));
	nor_loop: for i in 13 downto 1 generate
		NOT162: OR_gate port map(in1(i), not_result(i), or_result(i-1));
		NOT163: NOT_gate port map(or_result(i-1), not_result(i-1));
	end generate nor_loop;

	NOT164: OR_gate port map(in1(0), not_result(0), last_or_result);
	NOT165: NOT_gate port map(last_or_result, out1(0));
end Not16BitLogic;