library ieee;
use ieee.std_logic_1164.all;

entity AND_gate is
port(in1, in2: in std_logic;
	out1: out std_logic);
end AND_gate;

architecture AndGateLogic of AND_gate is
begin
	out1 <= in1 AND in2;
end AndGateLogic;