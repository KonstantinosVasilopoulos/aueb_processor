library ieee;
use ieee.std_logic_1164.all;

-- Κωνσταντινος Βασιλοπουλος 3180018
-- Ευθυμιος Παπαγεωργιου 3180144

-- Παρατηρηση
-- Παρατηρουμε πως οι registers καθυστερουν ενα κυκλο ρολογιου καθε φορα πρωτου αποκτησουν
-- τιμες. Πιο συγκεκριμενα, οι δυο πρωτοι καταχωρητες αποκτουν τιμες στο δευτερο clock pulse,
-- ενω ο τριτος καταχωρητης στο τριτο pulse. Αυτο σημαινει, πως και η ALU μπορει να ξεκινησει 
-- τους υπολογισμους της κατα τον δευτερο παλμο.

entity AUEB_PROCESSOR is
port(in1, in2: in std_logic_vector(15 downto 0);
	clock: in std_logic;
	operation: in std_logic_vector(2 downto 0);
	out1, out2, aluout, output: out std_logic_vector(15 downto 0));
end AUEB_PROCESSOR;

architecture ProcessorLogic of AUEB_PROCESSOR is
	component reg is
	port(d: in std_logic_vector(15 downto 0);
		clock, enable: in std_logic;
		out1: out std_logic_vector(15 downto 0));
	end component reg;

	component ALU_16bit is
	port(in1, in2: in std_logic_vector(15 downto 0);
		operation: in std_logic_vector(2 downto 0);
		out1: out std_logic_vector(15 downto 0));
	end component ALU_16bit;

	signal first_reg, second_reg, alu_result: std_logic_vector(15 downto 0);

begin
	-- First and second registers
	P0: reg port map(in1, clock, '1', first_reg);
	P1: reg port map(in2, clock, '1', second_reg);
	out1 <= first_reg;
	out2 <= second_reg;

	-- ALU
	P2: ALU_16bit port map(first_reg, second_reg, operation, alu_result);
	aluout <= alu_result;

	-- Final register
	P3: reg port map(alu_result, clock, '1', output);
end ProcessorLogic;