library ieee;
use ieee.std_logic_1164.all;

-- Κωνσταντινος Βασιλοπουλος 3180018
-- Ευθυμιος Παπαγεωργιου 3180144

entity AUEB_PROCESSOR is
port(keyData, fromData, instr: in std_logic_vector(15 downto 0);
	clock, clock2: in std_logic;
	printEnable, keyEnable, DataWriteFlag : out std_logic;
	dataAD, toData, printCode, printData, intstruction: out std_logic_vector(15 downto 0);
	regOUT : out std_logic_vector(143 downto 0));
end AUEB_PROCESSOR;

architecture ProcessorLogic of AUEB_PROCESSOR is
	component forwarder is
		generic ( addr_size : integer := 3);
		port (R1AD, R2AD, RegAD_EXMEM, RegAD_MEMWB : in std_logic_vector(addr_size-1 downto 0);
		S1, S2 : out std_logic_vector(1 downto 0));
	end component forwarder;

	component selector is
	generic (
		n : integer := 16
		);
		
	port (Reg, Memory, WriteBack : in std_logic_vector(n-1 downto 0);
		operation : in std_logic_vector(1 downto 0);
		output : out std_logic_vector(n-1 downto 0));
	end component;

	component control is
		port (opCode : in std_logic_vector(3 downto 0);
				func : in std_logic_vector(2 downto 0);
				flush : in std_logic;
				isMPFC, isJumpD, isReadDigit, isPrintDigit, isR, isLW, isSW, isBranch, isJR : out std_logic);
	end component;

	component hazardunit is
		port (isJR, isJump, wasJump, mustBranch : in std_logic;
				flush, wasJumpOut : out std_logic;
				JRopcode : out std_logic_vector(1 downto 0));
	end component;

	component register_if_id is
		generic (
			n:integer := 16
		);
		port (
			inPC, inInstruction : in std_logic_vector(n-1 downto 0);
			clock, if_flush, if_id_enable : in std_logic;
			outPC, outInstruction : out std_logic_vector(n-1 downto 0)
		);
	end component;

	component register_ex_mem is
		generic (
			n : integer := 16;
			addressSize : integer := 3 
		);
		port(
			clock, isLW, WriteEnable, ReadDigit, PrintDigit : in std_logic;
			R2Reg, Result : in std_logic_vector(n-1 downto 0);
			RegAD : in std_logic_vector(addressSize-1 downto 0);
			isLW_EXMEM, WriteEnable_EXMEM, ReadDigit_EXMEM, PrintDigit_EXMEM : out std_logic;
			R2Reg_EXMEM, Result_EXMEM : out std_logic_vector(n-1 downto 0);
			RegAD_EXMEM : out std_logic_vector(addressSize-1 downto 0)
		);
	end component;

	component register_mem_wb is
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
	end component;

	component register_id_ex is
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
	end component;

	component jrselector is
		 generic (
			  n : integer := 16
		 );
		 port (
			  jumpAD, branchAD, PCP2AD : in std_logic_vector(n - 1 downto 0);
			  JRopcode : in std_logic_vector(1 downto 0);
			  result : out std_logic_vector(n - 1 downto 0)
		 );
	end component;

	component reg16b is
		 port (
			  Input : in std_logic_vector(15 downto 0);
			  Enable, Clock : in std_logic;
			  Output : out std_logic_vector(15 downto 0)
		 );
	end component;

	component trapunit is
	port (
		 opCode : in std_logic_vector(3 downto 0);
		 EOR : out std_logic
	);
	end component;

	component regFile is
	generic (n : integer := 16;
				k : integer := 3;
				regNum : integer := 8);
	port (clock : in std_logic; 
		Write1 : in std_logic_vector (n-1 downto 0);
		Write1AD, Read1AD, Read2AD : in std_logic_vector(k-1 downto 0);
		Read1, Read2 : out std_logic_vector(n-1 downto 0);
		OUTall : out std_logic_vector(n*regNum-1 downto 0) 
		);
	end component;

	component ALUcontrol is
		 port(
			  opCode: in std_logic_vector(3 downto 0);
			  func: in std_logic_vector(2 downto 0);
			  output: out std_logic_vector(3 downto 0)
		 );
	end component;

	component sign_extender is
		 generic(
			  n: integer := 16;
			  k: integer := 6
		 );
		 port(
			  immediate: in std_logic_vector (k-1 downto 0);
			  extended: out std_logic_vector (n-1 downto 0)
		 );
	end component;

	component ALU_16bit is
	port(in1, in2: in std_logic_vector(15 downto 0);
		operation: in std_logic_vector(2 downto 0);
		out1: out std_logic_vector(15 downto 0));
	end component;
	
	component mux2to1 is
    port (
        sel : in std_logic;
        dataA, dataB : in std_logic_vector(15 downto 0);
        out0 : out std_logic_vector(15 downto 0)
    );
    end component;

	 -- Signals organized in sections according to their components
    -- Trap unit
    signal TrapEOR : std_logic;
	
	--result MEM WB 1
	signal RESULT_MEMWB1OUT0: std_logic_vector(15 downto 0);
	
	--result MEM WB 2
	signal RESULT_MEMWB2OUT0: std_logic_vector(15 downto 0);
	
	--jr selector
	signal JRresult : std_logic_vector(15 downto 0);
	
	-- OR gate 1
	signal comb1out : std_logic;
	
	--reg 16 bit
	signal PCOutput : std_logic_vector(15 downto 0);
	
	--reg MEM WB
	signal MEMWBREGwriteData : std_logic_vector(15 downto 0);
	signal MEMWBREGwriteAD : std_logic_vector(2 downto 0);

	--reg IF ID
	signal IFIDREGoutPC, IFIDREGoutInstraction : std_logic_vector(15 downto 0);
	
	--forwarder
	signal ForwardUnitS1, ForwardUnitS2 : std_logic_vector(1 downto 0);
	
	--selector 1
	signal Selector1output : std_logic_vector(15 downto 0);
	
	--selector 2
	signal Selector2output : std_logic_vector(15 downto 0);
	
	--ALU controler
	signal ALUControlleroutput : std_logic_vector(3 downto 0);
	
	--sign extendeder
	signal SignExtendextended : std_logic_vector(15 downto 0);
	
	--ALU input 1
	signal ALUInput1OUT0: std_logic_vector(15 downto 0);
	
	--ALU input 2
	signal ALUInput2OUT0: std_logic_vector(15 downto 0);
	
	--ALU
	signal ALU16CarryOut : std_logic;
	signal ALUOutput: std_logic_vector(15 downto 0);
	
	-- OR gate 2
	signal comb2out : std_logic;
	
	-- OR gate 3
	signal comb3out : std_logic;
	
	-- hazard unit
	signal Hazardflush, HazardwasJumpOut : std_logic;
	signal Hazardopcode : std_logic_vector(1 downto 0);
	
	 -- Register EX MEM
    signal EXMEMREGReadDigit_EXMEM, EXMEMREGisLW_EXMEM : std_logic;
    signal EXMEMREGR2Reg_EXMEM, EXMEMREGResult_EXMEM : std_logic_vector(15 downto 0);
    signal EXMEMREGRegAD_EXMEM : std_logic_vector(2 downto 0);

    -- Register ID EX
    signal IDEXREGIsBranch_IDEX, IDEXREGIsEOR_IDEX, IDEXREGIsLW_IDEX, IDEXREGIsMFPC_IDEX, IDEXREGIsPrintDigit_IDEX, IDEXREGIsR_IDEX, IDEXREGIsReadDigit_IDEX, IDEXREGIsSW_IDEX : std_logic;
    signal IDEXREGALUFunc_IDEX : std_logic_vector(3 downto 0);
    signal IDEXREGR1Reg_IDEX, IDEXREGR2Reg_IDEX, IDEXREGImmediate16_IDEX : std_logic_vector(15 downto 0);
    signal IDEXREGR2AD_IDEX, IDEXREGR1AD_IDEX : std_logic_vector(2 downto 0);
    signal IDEXREGJumpShortAddr_IDEX : std_logic_vector(11 downto 0);

    -- Register file
    signal RegisterFileRead1, RegisterFileRead2 : std_logic_vector(15 downto 0);
    signal RegisterFileOUTall : std_logic_vector(127 downto 0);

    -- R2AD multiplexer
    signal R2ADOUT0 : std_logic_vector(15 downto 0);

    --  Controller
    signal ControllerIsBranch, ControllerIsJR, ControllerIsJumpD, ControllerIsLW, ControllerIsMPCF, ControllerIsPrintDigit, ControllerIsR, ControllerIsReadDigit, ControllerIsSW : std_logic;
	
begin

	
	
end ProcessorLogic;