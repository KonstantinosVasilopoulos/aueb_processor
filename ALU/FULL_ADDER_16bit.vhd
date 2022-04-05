library ieee;
use ieee.std_logic_1164.all;

entity FULL_ADDER_16bit is
port(in1, in2: in std_logic_vector(15 downto 0);
	carry_in: in std_logic;
	out1: out std_logic_vector(15 downto 0);
	carry_out: out std_logic);
end FULL_ADDER_16bit;

architecture FullAdder16BitLogic of FULL_ADDER_16bit is
	component FULL_ADDER_1bit is
	port(in1, in2, carry_in: in std_logic;
		out1, carry_out: out std_logic);
	end component FULL_ADDER_1bit;

	signal carry_vec: std_logic_vector(14 downto 0);

begin
	FA160: FULL_ADDER_1bit port map(in1(0), in2(0), carry_in, out1(0), carry_vec(0));
	FA161: FULL_ADDER_1bit port map(in1(1), in2(1), carry_vec(0), out1(1), carry_vec(1));
	FA162: FULL_ADDER_1bit port map(in1(2), in2(2), carry_vec(1), out1(2), carry_vec(2));
	FA163: FULL_ADDER_1bit port map(in1(3), in2(3), carry_vec(2), out1(3), carry_vec(3));
	FA164: FULL_ADDER_1bit port map(in1(4), in2(4), carry_vec(3), out1(4), carry_vec(4));
	FA165: FULL_ADDER_1bit port map(in1(5), in2(5), carry_vec(4), out1(5), carry_vec(5));
	FA166: FULL_ADDER_1bit port map(in1(6), in2(6), carry_vec(5), out1(6), carry_vec(6));
	FA167: FULL_ADDER_1bit port map(in1(7), in2(7), carry_vec(6), out1(7), carry_vec(7));
	FA168: FULL_ADDER_1bit port map(in1(8), in2(8), carry_vec(7), out1(8), carry_vec(8));
	FA169: FULL_ADDER_1bit port map(in1(9), in2(9), carry_vec(8), out1(9), carry_vec(9));
	FA1610: FULL_ADDER_1bit port map(in1(10), in2(10), carry_vec(9), out1(10), carry_vec(10));
	FA1611: FULL_ADDER_1bit port map(in1(11), in2(11), carry_vec(10), out1(11), carry_vec(11));
	FA1612: FULL_ADDER_1bit port map(in1(12), in2(12), carry_vec(11), out1(12), carry_vec(12));
	FA1613: FULL_ADDER_1bit port map(in1(13), in2(13), carry_vec(12), out1(13), carry_vec(13));
	FA1614: FULL_ADDER_1bit port map(in1(14), in2(14), carry_vec(13), out1(14), carry_vec(14));
	FA1615: FULL_ADDER_1bit port map(in1(15), in2(15), carry_vec(14), out1(15), carry_out);
end FullAdder16BitLogic;