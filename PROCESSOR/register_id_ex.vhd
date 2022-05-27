library ieee;
use ieee.std_logic_1164.all;

entity register_id_ex is
    generic (
        n : integer := 16;
        addressSize : integer := 3
    );
    port (
        clock, isEOR, wasJumpOut, isJR, isBranch, isR, isMFPC, isLW, isSW, isReadDigit, isPrintDigit : in std_logic;
        ALUFunc: in std_logic_vector(3 downto 0);
        R1Reg, R2Reg, immediate16 : in std_logic_vector(n - 1 downto 0);
        R1AD, R2AD : in std_logic_vector(addressSize - 1 downto 0);
        jumpShortAddress : in std_logic_vector(11 downto 0);
        isEOR_IDEX, wasJumpOut_IDEX, isJR_IDEX, isBranch_IDEX, isR_IDEX, isMFPC_IDEX, isLW_IDEX, isSW_IDEX, isReadDigit_IDEX, isPrintDigit_IDEX : out std_logic;
        ALUFunc_IDEX: out std_logic_vector(3 downto 0);
        R1Reg_IDEX, R2Reg_IDEX, immediate16_IDEX : out std_logic_vector(n - 1 downto 0);
        R1AD_IDEX, R2AD_IDEX : out std_logic_vector(addressSize - 1 downto 0);
        jumpShortAddress_IDEX : out std_logic_vector(11 downto 0)
    );
end entity register_id_ex;

architecture register_id_exLogic of register_id_ex is
begin
    pc: process (clock)
    begin
        if clock = '1' then
            isEOR_IDEX <= isEOR;
            wasJumpOut_IDEX <= wasJumpOut;
            isJR_IDEX <= isJR;
            isBranch_IDEX <= isBranch;
            isR_IDEX <= isR;
            isMFPC_IDEX <= isMFPC;
            isLW_IDEX <= isLW;
            isSW_IDEX <= isSW;
            isReadDigit_IDEX <= isReadDigit;
            isPrintDigit_IDEX <= isPrintDigit;
            ALUFunc_IDEX <= ALUFunc;
            R1Reg_IDEX <= R1Reg;
            R2Reg_IDEX <= R2Reg;
            immediate16_IDEX <= immediate16;
            R1AD_IDEX <= R1AD;
            R2AD_IDEX <= R2AD;
            jumpShortAddress_IDEX <= jumpShortAddress;
        end if;
    end process pc;
end architecture register_id_exLogic;