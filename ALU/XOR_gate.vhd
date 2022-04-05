library ieee;
use ieee.std_logic_1164.all;

entity XOR_gate is
port(in1, in2: in std_logic;
	out1: out std_logic);
end XOR_gate;

architecture XorGateLogic of XOR_gate is
begin
	out1 <= in1 XOR in2;
end XorGateLogic;