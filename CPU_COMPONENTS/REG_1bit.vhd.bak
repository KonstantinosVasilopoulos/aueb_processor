library ieee;
use ieee.std_logic_1164.all;

entity REG_1bit is
port (in1, clock, enable : in std_logic;
	out1 : out std_logic);
end REG_1bit;

architecture Reg1BitLogic of REG_1bit is
signal p1, p2, p3, p4, p5, p6, afterClock : std_logic;
begin 
	p3 <= p1 nand p4;
	p1 <= afterClock nand p3;
		p2 <= not(afterClock and p1 and p4);
		p4 <= in1 nand p2;
		p5 <= p6 nand p1;
		p6 <= p2 nand p5;
		afterClock <= clock and enable;
		out1 <= p5;
end Reg1BitLogic;