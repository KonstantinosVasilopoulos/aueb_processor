library ieee;
use ieee.std_logic_1164.all;

entity forwarder is
	generic ( addr_size : integer := 3);
	port (R1AD, R2AD, RegAD_EXMEM, RegAD_MEMWB : in std_logic_vector(addr_size-1 downto 0);
	S1, S2 : out std_logic_vector(1 downto 0));
end entity forwarder;

architecture forwarderLogic of forwarder is
begin
	process (RegAD_EXMEM, RegAD_MEMWB, R1AD, R2AD)
	begin
		S1 <= "00";
		S2 <= "00";
		
		if(R1AD = RegAD_EXMEM) then
			S1 <= "10";
		elsif (R1AD = RegAD_MEMWB) then
			S1 <= "01";
		end if;
		if (R2AD = RegAD_EXMEM) then
			S2 <= "10";
		elsif (R2AD = RegAD_MEMWB) then
			S2 <= "01";
		end if;
	end process;
end architecture forwarderLogic;