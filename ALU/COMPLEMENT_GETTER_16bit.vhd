library ieee;
use ieee.std_logic_1164.all;

entity COMPLEMENT_GETTER_16bit is
port(in1: in std_logic_vector(15 downto 0);
	out1: out std_logic_vector(15 downto 0));
end COMPLEMENT_GETTER_16bit;

architecture ComplementGetter16BitLogic of COMPLEMENT_GETTER_16bit is
	component NOT_gate is
		port(in1: in std_logic;
		out1: out std_logic);
	end component NOT_gate;

	component FULL_ADDER_16bit is
	port(in1, in2: in std_logic_vector(15 downto 0);
		carry_in: in std_logic;
		out1: out std_logic_vector(15 downto 0);
		carry_out: out std_logic);
	end component FULL_ADDER_16bit;

	signal not_result: std_logic_vector(15 downto 0);
	signal one_16_bit: std_logic_vector(15 downto 0) := (others => '0');
	signal carry_out: std_logic;

begin
	-- 1's complement
	main_loop: for i in 15 downto 0 generate
		CG160: NOT_gate port map(in1(i), not_result(i));
	end generate main_loop;
	
	
	-- Add 1 to get the 2's complement
	one_16_bit(0) <= '1';
	CG161: FULL_ADDER_16bit port map(not_result, one_16_bit, '0', out1, carry_out);
end ComplementGetter16BitLogic;