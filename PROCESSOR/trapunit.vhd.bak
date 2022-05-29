library ieee;
use ieee.std_logic_1164.all;

entity trapunit is
port (
    opCode : in std_logic_vector(3 downto 0);
    EOR : out std_logic
);
end trapunit;

architecture trapunitLogic of trapunit is
begin
    process (opCode)
    begin
        if opCode = "1110" then
            EOR <= '1';
        else
            EOR <= '0';
        end if;
    end process;
end architecture trapunitLogic;