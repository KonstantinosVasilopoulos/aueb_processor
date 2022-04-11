library ieee;
use ieee.std_logic_1164.all;

entity SR_LATCH is
port(set, reset: in std_logic;
	out1, out2: out std_logic);
end SR_LATCH;

architecture SRLatchLogic of SR_LATCH is
	component NOT_gate is
	port(in1: in std_logic;
		out1: out std_logic);
	end component NOT_gate;

	component AND_gate is
	port(in1, in2: in std_logic;
		out1: out std_logic);
	end component AND_gate;

	signal set_and_result, reset_and_result, set_not_result, reset_not_result: std_logic;

begin
	SR0: AND_gate port map(set, reset_not_result, set_and_result);
	SR1: NOT_gate port map(set_and_result, set_not_result);
	SR2: AND_gate port map(reset, set_not_result, reset_and_result);
	SR3: NOT_gate port map(reset_and_result, reset_not_result);
	out1 <= set_not_result;
	out2 <= reset_not_result;
end SRLatchLogic;