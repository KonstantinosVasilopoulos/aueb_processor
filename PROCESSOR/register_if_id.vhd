library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_if_id is
	generic (
		n:integer := 16
	);
	port (
		inPC, inInstruction : in std_logic_vector(n-1 downto 0);
		clock, if_flush, if_id_enable : in std_logic;
		outPC, outInstruction : out std_logic_vector(n-1 downto 0)
	);
end register_if_id;

architecture register_if_idLogic of register_if_id is
begin
	pc : process(clock, if_flush, if_id_enable)
	begin
		if clock = '1' and if_id_enable = '1' then
			outPC <= std_logic_vector(unsigned(inPC) + 2);
			outInstruction <= inInstruction;
		elsif clock = '1' and if_flush = '1' then
			outPC <= (others => '0');
			outInstruction <= (others => '0');
		end if;
	end process pc;
end architecture register_if_idLogic;