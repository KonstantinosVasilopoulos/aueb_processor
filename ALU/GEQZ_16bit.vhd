library ieee;
use ieee.std_logic_1164.all;

entity GEQZ_16bit is
port(in1: in std_logic_vector(15 downto 0);
	out1: out std_logic_vector(15 downto 0) := (others => '0'));
end GEQZ_16bit;

architecture GeqZ16BitLogic of GEQZ_16bit is
	component NOT_gate is
	port(in1: in std_logic;
		out1: out std_logic);
	end component NOT_gate;
begin
	GEQZ0: NOT_gate port map(in1(0), out1(0));
end GeqZ16BitLogic;