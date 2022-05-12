library ieee;
use ieee.std_logic_1164.all;

entity reg0 is
generic (n : integer := 16);
port (in1 : in std_logic_vector(n-1 downto 0); 
	clock, enable : in std_logic;
	out1 : out std_logic_vector(n-1 downto 0));
end reg0;

architecture Reg0Logic of reg0 is
	component REG_1bit is
		port (in1, clock, enable : in std_logic;
			out1 : out std_logic);
	end component REG_1bit;

begin 
	out1 <= (others => '0');
end Reg0Logic;