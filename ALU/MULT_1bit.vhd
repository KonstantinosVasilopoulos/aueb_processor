library ieee;
use ieee.std_logic_1164.all;

-- 2 to 1 multiplexer
entity MULT_1bit is
port(in1, in2: in std_logic_vector(15 downto 0);
	select_bit: in std_logic;
	out1: out std_logic_vector(15 downto 0));
end MULT_1bit;

architecture Mult1BitLogic of MULT_1bit is
	component AND_16bit is
	port(in1, in2: in std_logic_vector(15 downto 0);
		out1: out std_logic_vector(15 downto 0));
	end component AND_16bit;

	component OR_16bit is
	port(in1, in2: in std_logic_vector(15 downto 0);
		out1: out std_logic_vector(15 downto 0));
	end component OR_16bit;
	
	component NOT_gate is
	port(in1: in std_logic;
		out1: out std_logic);
	end component NOT_gate;

	signal not_result_vec, select_vec, first_and_result, second_and_result: std_logic_vector(15 downto 0);
	signal not_result: std_logic;

	-- subtype range_16 is natural range 15 downto 0;

begin
	M10: NOT_gate port map(select_bit, not_result);
	select_vec(15) <= select_bit;
	not_result_vec(15) <= not_result;
	select_vec(14) <= select_bit;
	not_result_vec(14) <= not_result;
	select_vec(13) <= select_bit;
	not_result_vec(13) <= not_result;
	select_vec(12) <= select_bit;
	not_result_vec(12) <= not_result;
	select_vec(11) <= select_bit;
	not_result_vec(11) <= not_result;
	select_vec(10) <= select_bit;
	not_result_vec(10) <= not_result;
	select_vec(9) <= select_bit;
	not_result_vec(9) <= not_result;
	select_vec(8) <= select_bit;
	not_result_vec(8) <= not_result;
	select_vec(7) <= select_bit;
	not_result_vec(7) <= not_result;
	select_vec(6) <= select_bit;
	not_result_vec(6) <= not_result;
	select_vec(5) <= select_bit;
	not_result_vec(5) <= not_result;
	select_vec(4) <= select_bit;
	not_result_vec(4) <= not_result;
	select_vec(3) <= select_bit;
	not_result_vec(3) <= not_result;
	select_vec(2) <= select_bit;
	not_result_vec(2) <= not_result;
	select_vec(1) <= select_bit;
	not_result_vec(1) <= not_result;
	select_vec(0) <= select_bit;
	not_result_vec(0) <= not_result;

	M11: AND_16bit port map(in1, not_result_vec, first_and_result);
	M12: AND_16bit port map(in2, select_vec, second_and_result);
	M13: OR_16bit port map(first_and_result, second_and_result, out1);
end Mult1BitLogic;