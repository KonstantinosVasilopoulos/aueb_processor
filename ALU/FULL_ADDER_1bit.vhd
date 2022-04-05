library ieee;
use ieee.std_logic_1164.all;

entity FULL_ADDER_1bit is
port(in1, in2, carry_in: in std_logic;
	out1, carry_out: out std_logic);
end FULL_ADDER_1bit;

architecture FullAdder1BitLogic of FULL_ADDER_1bit is
	component AND_gate is
	port(in1, in2: in std_logic;
		out1: out std_logic);
	end component AND_gate;
	
	component OR_gate is
	port(in1, in2: in std_logic;
		out1: out std_logic);
	end component OR_gate;

	component XOR_gate is
	port(in1, in2: in std_logic;
		out1: out std_logic);
	end component XOR_gate;

	signal first_xor_result, first_and_result, second_and_result: std_logic;
begin
	FAO0: XOR_gate port map(in1, in2, first_xor_result);
	FAO1: XOR_gate port map(first_xor_result, carry_in, out1);
	FAO2: AND_gate port map(first_xor_result, carry_in, first_and_result);
	FAO3: AND_gate port map(in1, in2, second_and_result);
	FAO4: OR_gate port map(first_and_result, second_and_result, carry_out);
end FullAdder1BitLogic;