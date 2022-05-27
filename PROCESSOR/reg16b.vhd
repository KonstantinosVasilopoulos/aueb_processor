library ieee;
use ieee.std_logic_1164.all;

--top level entity
entity reg16b is
    port (
        Input : in std_logic_vector(15 downto 0);
        Enable, Clock : in std_logic;
        Output : out std_logic_vector(15 downto 0)
    );
end entity reg16b;

architecture reg16bLogic of reg16b is
begin
    process (Clock)
    begin
        if Clock'EVENT and Clock = '0' then
            if Enable = '1' then
                Output <= Input;
            end if;
        end if;
    end process;
end architecture reg16bLogic;