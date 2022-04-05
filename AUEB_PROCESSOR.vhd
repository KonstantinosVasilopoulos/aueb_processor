library ieee;
use ieee.std_logic_1164.all;

entity AUEB_PROCESSOR is
port(in1: in std_logic;
	out1: out std_logic);
end AUEB_PROCESSOR;

architecture ProcessorLogic of AUEB_PROCESSOR is
begin
	out1 <= in1;
end ProcessorLogic;