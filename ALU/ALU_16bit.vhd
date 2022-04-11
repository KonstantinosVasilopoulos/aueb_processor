library ieee;
use ieee.std_logic_1164.all;

entity ALU_16bit is
port(in1, in2: in std_logic_vector(15 downto 0);
	operation: in std_logic_vector(2 downto 0);
	out1: out std_logic_vector(15 downto 0));
end ALU_16bit;

architecture ALULogic of ALU_16bit is
	component NOT_16bit is
	port(in1: in std_logic_vector(15 downto 0);
		out1: out std_logic_vector(15 downto 0) := (others => '0'));
	end component NOT_16bit;

	component AND_16bit is
	port(in1, in2: in std_logic_vector(15 downto 0);
		out1: out std_logic_vector(15 downto 0));
	end component AND_16bit;

	component OR_16bit is
	port(in1, in2: in std_logic_vector(15 downto 0);
		out1: out std_logic_vector(15 downto 0));
	end component OR_16bit;

	component GEQZ_16bit is
	port(in1: in std_logic_vector(15 downto 0);
		out1: out std_logic_vector(15 downto 0) := (others => '0'));
	end component GEQZ_16bit;

	component COMPLEMENT_GETTER_16bit is
	port(in1: in std_logic_vector(15 downto 0);
		out1: out std_logic_vector(15 downto 0));
	end component COMPLEMENT_GETTER_16bit;

	-- 2 to 1 multiplexer
	component MULT_1bit is
	port(in1, in2: in std_logic_vector(15 downto 0);
		select_bit: in std_logic;
		out1: out std_logic_vector(15 downto 0));
	end component MULT_1bit;

	component FULL_ADDER_16bit is
	port(in1, in2: in std_logic_vector(15 downto 0);
		carry_in: in std_logic;
		out1: out std_logic_vector(15 downto 0);
		carry_out: out std_logic);
	end component FULL_ADDER_16bit;

	-- 8 to 1 multiplexer
	component MULT_3bit is
	port(in1, in2, in3, in4, in5, in6: in std_logic_vector(15 downto 0);
		select_bits: in std_logic_vector(2 downto 0);
		out1: out std_logic_vector(15 downto 0));
	end component MULT_3bit;

	signal complement_one_in2, addition_in2, full_adder_result: std_logic_vector(15 downto 0);
	signal carry_out: std_logic;
	signal and_result, or_result, geq_result, not_result: std_logic_vector(15 downto 0);
	signal final_result: std_logic_vector(15 downto 0);

begin
	-- Arithmetic Unit
	-- Produce the negative number of in2
	A0: COMPLEMENT_GETTER_16bit port map(in2, complement_one_in2);
	A1: MULT_1bit port map(in2, complement_one_in2, operation(0), addition_in2);
	A2: FULL_ADDER_16bit port map(in1, addition_in2, '0', full_adder_result, carry_out);

	-- Logic Unit
	A3: AND_16bit port map(in1, in2, and_result);
	A4: OR_16bit port map(in1, in2, or_result);
	A5: GEQZ_16bit port map(in1, geq_result);
	A6: NOT_16bit port map(in1, not_result);

	-- Operation Multiplexer
	A7: MULT_3bit port map(full_adder_result, full_adder_result, and_result, or_result, geq_result, not_result, operation, final_result);
	out1 <= final_result;
end ALULogic;