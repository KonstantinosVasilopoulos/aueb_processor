library ieee;
use ieee.std_logic_1164.all;

entity reg is
port(d: in std_logic_vector(15 downto 0);
	clock, enable: in std_logic;
	out1: out std_logic_vector(15 downto 0));
end reg;

architecture RegLogic of reg is
	component FLIP_FLOP_1bit is
	port(d, clock, enable: in std_logic;
		out1, out2: out std_logic);
	end component FLIP_FLOP_1bit;

	signal after_clock: std_logic;
	signal flip_flop_not: std_logic_vector(15 downto 0);

begin	
	-- Create 16 flip-flops
	flip_flops_loop: for i in 15 downto 0 generate
		REG0: FLIP_FLOP_1bit port map(d(i), clock, enable, out1(i), flip_flop_not(i));
	end generate flip_flops_loop;
end RegLogic;