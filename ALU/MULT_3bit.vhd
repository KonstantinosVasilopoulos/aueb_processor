library ieee;
use ieee.std_logic_1164.all;

-- 8 to 1 multiplexer
entity MULT_3bit is
port(in1, in2, in3, in4, in5, in6: in std_logic_vector(15 downto 0);
	select_bits: in std_logic_vector(2 downto 0);
	out1: out std_logic_vector(15 downto 0));
end MULT_3bit;

architecture Mult3BitLogic of MULT_3bit is
	component MULT_1bit is
	port(in1, in2: in std_logic_vector(15 downto 0);
		select_bit: in std_logic;
		out1: out std_logic_vector(15 downto 0));
	end component MULT_1bit;

	signal first_mux_1, second_mux_1, third_mux_1, fourth_mux_1: std_logic_vector(15 downto 0);
	signal first_mux_2, second_mux_2: std_logic_vector(15 downto 0);

begin
	-- First stage
	M30: MULT_1bit port map(in1, in2, select_bits(0), first_mux_1);
	M31: MULT_1bit port map(in3, in4, select_bits(0), second_mux_1);
	M32: MULT_1bit port map(in5, in6, select_bits(0), third_mux_1);
	M33: MULT_1bit port map("0000000000000000", "0000000000000000", select_bits(0), fourth_mux_1);

	-- Second stage
	M34: MULT_1bit port map(first_mux_1, second_mux_1, select_bits(1), first_mux_2);
	M35: MULT_1bit port map(third_mux_1, fourth_mux_1, select_bits(1), second_mux_2);

	-- Third stage
	M36: MULT_1bit port map(first_mux_2, second_mux_2, select_bits(2), out1);
end Mult3BitLogic;