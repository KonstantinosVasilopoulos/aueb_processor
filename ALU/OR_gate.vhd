library ieee;
use ieee.std_logic_1164.all;

entity OR_gate is
port(in1, in2: in std_logic;
	out1: out std_logic);
end OR_gate;

architecture OrGateLogic of OR_gate is
begin
	out1 <= in1 OR in2;
end OrGateLogic;