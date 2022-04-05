library ieee;
use ieee.std_logic_1164.all;

entity GET_1bit is
port(in1, in2: in std_logic;
	out1: out std_logic);
end GET_1bit;

architecture Geq1BitLogic of GET_1bit is
begin
	out1 <= NOT in1;
end Geq1BitLogic;