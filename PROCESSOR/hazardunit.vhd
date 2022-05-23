library ieee;
use ieee.std_logic_1164.all;

entity hazardunit is
	port (isJR, isJump, wasJump, mustBranch : in std_logic;
			flush, wasJumpOut : out std_logic;
			JRopcode : out std_logic_vector(1 downto 0));
end entity hazardunit;

architecture hazardunitLogic of hazardunit is
begin
	process (isJR, isJump, wasJump, mustBranch)
	begin
		flush <= '0';
		if isJr = '1' or isJump = '1' or wasJump = '1' or mustBranch = '1' then
			flush <= '1';
		end if;
		if isJump = '1' then
			JRopcode <= "01";
		elsif mustBranch = '1' then
			JRopcode <= "10";
		else
			JRopcode <= "00";
		end if;
	end process;
end architecture hazardunitLogic;