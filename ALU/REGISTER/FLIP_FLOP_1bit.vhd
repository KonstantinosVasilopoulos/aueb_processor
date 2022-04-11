library ieee;
use ieee.std_logic_1164.all;

entity FLIP_FLOP_1bit is
port(d, clock, enable: in std_logic;
	out1, out2: out std_logic);
end FLIP_FLOP_1bit;

architecture FlipFlop1BitLogic of FLIP_FLOP_1bit is
	component AND_gate is
	port(in1, in2: in std_logic;
		out1: out std_logic);
	end component AND_gate;

	component SR_LATCH is
	port(set, reset: in std_logic;
		out1, out2: out std_logic);
	end component SR_LATCH;

	signal after_clock, first_latch, first_latch_not, second_latch, second_latch_not, second_latch_set: std_logic;

begin
	FF10: AND_gate port map(clock, enable, after_clock);

	-- First SR Latch
	FF11: SR_LATCH port map(second_latch_not, after_clock, first_latch, first_latch_not);

	-- Second SR Latch
	FF12: AND_gate port map(first_latch_not, after_clock, second_latch_set);
	FF13: SR_LATCH port map(second_latch_set, d, second_latch, second_latch_not);

	-- Third SR Latch
	FF14: SR_LATCH port map(first_latch_not, second_latch, out1, out2);
end FlipFlop1BitLogic;