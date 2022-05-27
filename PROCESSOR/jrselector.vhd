library ieee;
use ieee.std_logic_1164.all;

entity jrselector is
    generic (
        n : integer := 16
    );
    port (
        jumpAD, branchAD, PCP2AD : in std_logic_vector(n - 1 downto 0);
        JRopcode : in std_logic_vector(1 downto 0);
        result : out std_logic_vector(n - 1 downto 0)
    );
end entity jrselector;

architecture jrselectorLogic of jrselector is
begin
    process (JRopcode)
    begin
        case JRopcode is
            when "00" =>
                result <= PCP2AD;
            when "01" =>
                result <= jumpAD;
            when "10" =>
                result <= branchAD;
            when others => result <= PCP2AD;
        end case;
    end process;
end architecture jrselectorLogic;