library ieee;
use ieee.std_logic_1164.all;

entity sign_extender is
    generic(
        n: integer := 16;
        k: integer := 6
    );
    port(
        immediate: in std_logic_vector (k-1 downto 0);
        extended: out std_logic_vector (n-1 downto 0)
    );
end sign_extender;

architecture sign_extenderLogic of sign_extender is
begin
    extended <= (n-1 downto k => immediate(k-1)) & (immediate);
end sign_extenderLogic;