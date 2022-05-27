library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_mem_wb is
	generic (
		n : integer := 16;
		addressSize : integer := 3 
	);
	port(
		Result : in std_logic_vector(n-1 downto 0);
		RegAD : in std_logic_vector(addressSize-1 downto 0);
		clk : in std_logic;
		writeData : out std_logic_vector(n-1 downto 0);
		writeAD : out std_logic_vector(addressSize-1 downto 0)
	);
end register_mem_wb;

architecture register_mem_wbLogic of register_mem_wb is
begin 
pc : process(clk)
	begin
		if clk = '1' then
			writeAD <= RegAD;
			WriteData <= Result;
		end if;
	end process pc;
end architecture register_mem_wbLogic;	