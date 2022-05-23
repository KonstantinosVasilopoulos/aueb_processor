library ieee;
use ieee.std_logic_1164.all;

entity selector is
generic (
	n : integer := 16
	);
	
port (Reg, Memory, WriteBack : in std_logic_vector(n-1 downto 0);
	operation : in std_logic_vector(1 downto 0);
	output : out std_logic_vector(n-1 downto 0));
end selector;

architecture selectorLogic of selector is
begin
	with operation select
		output <= Reg when "00",
		WriteBack when "01",
		Memory when "10",
		"0000000000000000" when "11";
end architecture selectorLogic;