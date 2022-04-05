library ieee;
use ieee.std_logic_1164.all;

entity GEQ_16bit is
port(in1, in2: in std_logic_vector(15 downto 0);
	out1: out std_logic);
end GEQ_16bit;

architecture Geq16BitLogic of GEQ_16bit is
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

	signal not_in, and_result, xor_result, nxor_result: std_logic_vector(15 downto 0);
	signal greater_cmp_result, equal_cmp_result: std_logic_vector(13 downto 0);
	signal greater_result, equal_result: std_logic;

begin
	-- Pass all bits belonging to one of the inputs through NOT gates
	-- and then compare them with the other input via AND gates
	in_loop: for i in 15 downto 0 generate
		GEQ0: NOT_gate port map(in2(i), not_in(i));
		GEQ1: AND_gate port map(in1(i), not_in(i), and_result(i));
		GEQ2: XOR_gate port map(in1(i), in2(i), xor_result(i));
		GEQ3: NOT_gate port map(xor_result(i), nxor_result(i));
	end generate in_loop;
	
	GEQ4: OR_gate port map(and_result(15), and_result(14), greater_cmp_result(13));
	GEQ5: AND_gate port map(nxor_result(15), nxor_result(14), equal_cmp_result(13));
	result_loop: for i in 13 downto 1 generate
		GEQ6: OR_gate port map(and_result(i), greater_cmp_result(i), greater_cmp_result(i-1));
		GEQ7: AND_gate port map(nxor_result(i), equal_cmp_result(i), equal_cmp_result(i-1));
	end generate result_loop;
	
	GEQ8: OR_gate port map(and_result(0), greater_cmp_result(0), greater_result);
	GEQ9: AND_gate port map(nxor_result(0), equal_cmp_result(0), equal_result);
	
	GEQ10: OR_gate port map(greater_result, equal_result, out1);
end Geq16BitLogic;