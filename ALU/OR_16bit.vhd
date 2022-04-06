library ieee;
use ieee.std_logic_1164.all;

entity OR_16bit is
port(in1, in2: in std_logic_vector(15 downto 0);
	out1: out std_logic_vector(15 downto 0));
end OR_16bit;

architecture Or16BitLogic of OR_16bit is
component OR_gate is
	port(in1, in2: in std_logic;
		out1: out std_logic);
	end component OR_gate;
begin
	or_loop: for i in 15 downto 0 generate
		OR160: OR_gate port map(in1(i), in2(i), out1(i));
	end generate or_loop;
end Or16BitLogic;