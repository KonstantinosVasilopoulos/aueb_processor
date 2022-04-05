library ieee;
use ieee.std_logic_1164.all;

entity SUB_1bit is
port(in1, in2, borrow_in: in std_logic;
	diff, borrow_out: out std_logic);
end SUB_1bit;

architecture Sub1BitLogic of SUB_1bit is
	component NOT_gate is
	port(in1: in std_logic;
		out1: out std_logic);
	end component NOT_gate;

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
	
	signal xor_result, not_in1, not_xor, first_and_result, second_and_result: std_logic;
begin
	SO0: XOR_gate port map(in1, in2, xor_result);
	SO1: XOR_gate port map(xor_result, borrow_in, diff);
	SO2: NOT_gate port map(in1,not_in1);
	SO3: NOT_gate port map(xor_result, not_xor);
	SO4: AND_gate port map(not_in1, in2, first_and_result);
	SO5: AND_gate port map(not_xor, borrow_in, second_and_result);
	SO6: OR_gate port map(first_and_result, second_and_result, borrow_out);
end Sub1BitLogic;