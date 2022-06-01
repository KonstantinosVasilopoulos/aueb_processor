library ieee;
use ieee.std_logic_1164.all;

-- Κωνσταντίνος Βασιλόπουλος 3180018
-- Ευθυμίος Παπαγεωργίου 3180144
-- Αλέξανδρος Καράλης 3180070

entity AUEB_PROCESSOR is
port(keyData, fromData, instr: in std_logic_vector(15 downto 0);
	clock, clock2: in std_logic;
	printEnable, keyEnable, DataWriteFlag : out std_logic;
	dataAD, toData, printCode, printData, intstructionAD: out std_logic_vector(15 downto 0);
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
			  clock, isEOR, wasJumpOut, isJump, isJR, isBranch, isR, isMFPC, isLW, isSW, isReadDigit, isPrintDigit : in std_logic;
			  ALUFunc: in std_logic_vector(3 downto 0);
			  R1Reg, R2Reg, immediate16 : in std_logic_vector(n - 1 downto 0);
			  R1AD, R2AD : in std_logic_vector(addressSize - 1 downto 0);
			  jumpShortAddress : in std_logic_vector(11 downto 0);
			  isEOR_IDEX, wasJumpOut_IDEX, isJump_IDEX, isJR_IDEX, isBranch_IDEX, isR_IDEX, isMFPC_IDEX, isLW_IDEX, isSW_IDEX, isReadDigit_IDEX, isPrintDigit_IDEX : out std_logic;
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
	port(carry_in : in std_logic;
		in1, in2: in std_logic_vector(15 downto 0);
		operation: in std_logic_vector(3 downto 0);
		out1: out std_logic_vector(15 downto 0);
		carry_out: out std_logic);
	end component;
	
	component mux2to1 is
	generic ( 
		n : integer := 16
	);
    port (
        sel : in std_logic;
        dataA, dataB : in std_logic_vector(n-1 downto 0);
        out0 : out std_logic_vector(n-1 downto 0)
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
	signal JRjumpAD, JRresult : std_logic_vector(15 downto 0);
	
	-- OR gate 1
	signal comb1out : std_logic;
	
	--reg 16 bit
	signal PCOutput : std_logic_vector(15 downto 0);
	
	--reg MEM WB
	signal MEMWBREGwriteData : std_logic_vector(15 downto 0);
	signal MEMWBREGwriteAD : std_logic_vector(2 downto 0);

	--reg IF ID
	signal IFIDREGoutPC, IFIDREGoutInstruction : std_logic_vector(15 downto 0);
	
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
	signal ALU16Output: std_logic_vector(15 downto 0);
	
	-- AND gate 2
	signal comb2out : std_logic;
	
	-- OR gate 3
	signal comb3out : std_logic;
	
	-- hazard unit
	signal Hazardflush, HazardwasJumpOut : std_logic;
	signal Hazardopcode : std_logic_vector(1 downto 0);
	
	 -- Register EX MEM
    signal EXMEMREGPrintDigit_EXMEM, EXMEMREGReadDigit_EXMEM, EXMEMREGWriteEnable_EXMEM, EXMEMREGisLW_EXMEM : std_logic;
    signal EXMEMREGR2Reg_EXMEM, EXMEMREGResult_EXMEM : std_logic_vector(15 downto 0);
    signal EXMEMREGRegAD_EXMEM : std_logic_vector(2 downto 0);

    -- Register ID EX
    signal IDEXREGIsBranch_IDEX, IDEXREGIsEOR_IDEX, IDEXREGWasJumpOut_IDEX, IDEXREGIsJump_IDEX, IDEXREGIsJR_IDEX, IDEXREGIsLW_IDEX, IDEXREGIsMFPC_IDEX, IDEXREGIsPrintDigit_IDEX, IDEXREGIsR_IDEX, IDEXREGIsReadDigit_IDEX, IDEXREGIsSW_IDEX : std_logic;
    signal IDEXREGALUFunc_IDEX : std_logic_vector(3 downto 0);
    signal IDEXREGR1Reg_IDEX, IDEXREGR2Reg_IDEX, IDEXREGImmediate16_IDEX : std_logic_vector(15 downto 0);
    signal IDEXREGR2AD_IDEX, IDEXREGR1AD_IDEX : std_logic_vector(2 downto 0);
    signal IDEXREGJumpShortAddr_IDEX : std_logic_vector(11 downto 0);

    -- Register file
    signal RegisterFileRead1, RegisterFileRead2 : std_logic_vector(15 downto 0);
    signal RegisterFileOUTall : std_logic_vector(127 downto 0);

    -- R2AD multiplexer
    signal R2ADOUT0 : std_logic_vector(2 downto 0);

    --  Controller
    signal ControllerIsBranch, ControllerIsJR, ControllerIsJumpD, ControllerIsLW, ControllerIsMPFC, ControllerIsPrintDigit, ControllerIsR, ControllerIsReadDigit, ControllerIsSW : std_logic;
	
begin
	
	--sel dataA out0
	result_MEMWB1 : mux2to1 port map (EXMEMREGReadDigit_EXMEM, EXMEMREGResult_EXMEM, keyData, RESULT_MEMWB1OUT0); 
	result_MEMWB2 : mux2to1 port map (EXMEMREGisLW_EXMEM, RESULT_MEMWB1OUT0, fromData, RESULT_MEMWB2OUT0);
	--opCode EOR  
	Trap : trapunit port map(IFIDREGoutInstruction(15 downto 12), TrapEOR);
	--jumbAD branchAD PCP2AD JRopcode result 
	JRjumpAD <= "0000" & IDEXREGJumpShortAddr_IDEX;
	JR : JRSelector port map(JRjumpAD, 
	IDEXREGImmediate16_IDEX, 
	IFIDREGoutPC,
	Hazardopcode,
	JRresult);
	
	comp1 : comb1out <= trapEOR or IDEXREGIsEOR_IDEX;
	--input enable clock output
	PC : reg16b port map(JRresult, not comb1out, clock, PCoutput);
	--Result RegAD clk writeData write1AD
	MEMWBREG : register_mem_wb port map(RESULT_MEMWB2OUT0, EXMEMREGRegAD_EXMEM, clock, MEMWBREGwriteData, MEMWBREGwriteAD);
	--inPC inInstruction clock if_flush if_id_enable outPC outInstruction
	IFIDREG : register_if_id port map(PCOutput, instr, clock, '0', '1', IFIDREGoutPC, IFIDREGoutInstruction);
	--R1AD R2AD RegAD RegAD_EXMEM RegAD_MEMWB S1 S1
	ForwardUnit : forwarder port map(IDEXREGR1AD_IDEX, IDEXREGR2AD_IDEX, EXMEMREGRegAD_EXMEM, MEMWBREGwriteAD, ForwardUnitS1, ForwardUnitS2);
	
	-- OR gate leading to controller
	comb3out <= Hazardflush or IDEXREGIsEOR_IDEX;
	
	Selector1 : selector port map(IDEXREGR1Reg_IDEX, RESULT_MEMWB2OUT0, MEMWBREGwriteData, ForwardUnitS1,Selector1output);

	Selector2 : selector port map(IDEXREGR2Reg_IDEX, RESULT_MEMWB2OUT0, MEMWBREGwriteData, ForwardUnitS2, Selector2output );

	ALUController : ALUControl port map(IFIDREGoutInstruction(15 downto 12), IFIDREGoutInstruction(2 downto 0), ALUControlleroutput );

	SignExtend : sign_extender port map(IFIDREGoutInstruction(5 downto 0), SignExtendextended );

	ALUInput1 : mux2to1 port map(IDEXREGIsMFPC_IDEX, IFIDREGoutPC, Selector1output, ALUInput1OUT0);

	ALUInput2 : mux2to1 port map(IDEXREGIsR_IDEX, Selector2output, IDEXREGImmediate16_IDEX, ALUInput2OUT0 );

	ALU16 : ALU_16bit port map('0', ALUInput1OUT0, ALUInput2OUT0, IDEXREGALUFunc_IDEX, ALU16Output, ALU16CarryOut);


	comp2 : comb2out <= ALU16CarryOut and IDEXREGIsBranch_IDEX;
	
	Hazard : hazardUnit port map(ControllerIsJr, ControllerIsJumpD, comb2out , '0', Hazardflush, HazardwasJumpOut, Hazardopcode );

	-- Controller
	Controller: control port map(
		IFIDREGoutInstruction(15 downto 12), -- op code
		IFIDREGoutInstruction(2 downto 0), -- function
		comb3out, -- OR gate output
		ControllerIsMPFC,
		ControllerIsJumpD,
		ControllerIsReadDigit,
		ControllerIsPrintDigit,
		ControllerIsR,
		ControllerIsLW,
		ControllerIsSW,
		ControllerIsBranch,
		ControllerIsJR
	);

	-- Read 2nd address multiplexer
	R2AD: mux2to1 generic map(
		n => 3
	)
	port map(
		ControllerIsR, -- select
		IFIDREGoutInstruction(5 downto 3), -- data A
		IFIDREGoutInstruction(8 downto 6), -- data B
		R2ADOUT0
	);

	-- Register file
	RegisterFile: regFile port map(
		clock2,
		MEMWBREGwriteData,
		MEMWBREGwriteAD, -- write address
		IFIDREGoutInstruction(8 downto 6), -- read 1st address
		R2ADOUT0, -- read 2nd address
		RegisterFileRead1,
		RegisterFileRead2,
		RegisterFileOUTall
	);

	-- Register ID EX
	IDEXREG: register_id_ex port map(
		clock,
		TrapEOR,
		HazardwasJumpOut,
		ControllerIsJumpD,
		ControllerIsJR,
		ControllerIsBranch,
		ControllerIsR,
		ControllerIsMPFC,
		ControllerIsLW,
		ControllerIsSW,
		ControllerIsReadDigit,
		ControllerIsPrintDigit,
		ALUControlleroutput,
		RegisterFileRead1, -- R1Reg
		RegisterFileRead2, -- R2Reg
		SignExtendextended, -- immediate16
		IFIDREGoutInstruction(8 downto 6), -- R1AD
		R2ADOUT0, -- R2AD
		IFIDREGoutInstruction(11 downto 0), -- jumpShortAddress
		IDEXREGIsEOR_IDEX,
		IDEXREGWasJumpOut_IDEX,
		IDEXREGIsJump_IDEX,
		IDEXREGIsJR_IDEX,
		IDEXREGIsBranch_IDEX,
		IDEXREGIsR_IDEX,
		IDEXREGIsMFPC_IDEX,
		IDEXREGIsLW_IDEX,
		IDEXREGIsSW_IDEX,
		IDEXREGIsReadDigit_IDEX,
		IDEXREGIsPrintDigit_IDEX,
		IDEXREGALUFunc_IDEX,
		IDEXREGR1Reg_IDEX,
		IDEXREGR2Reg_IDEX,
		IDEXREGImmediate16_IDEX,
		IDEXREGR1AD_IDEX,
		IDEXREGR2AD_IDEX,
		IDEXREGJumpShortAddr_IDEX
	);

	-- Register EX MEM
	EXMEMREG: register_ex_mem port map(
		clock,
		IDEXREGIsLW_IDEX,		
		IDEXREGIsSW_IDEX,
		IDEXREGIsReadDigit_IDEX,
		IDEXREGIsPrintDigit_IDEX,
		IDEXREGR2Reg_IDEX,
		ALU16Output,
		IDEXREGR2AD_IDEX,
		EXMEMREGisLW_EXMEM,
		EXMEMREGWriteEnable_EXMEM,
		EXMEMREGReadDigit_EXMEM,
		EXMEMREGPrintDigit_EXMEM,
    	EXMEMREGR2Reg_EXMEM,
		EXMEMREGResult_EXMEM,
    	EXMEMREGRegAD_EXMEM
	);

	-- Register out
	printEnable <= EXMEMREGPrintDigit_EXMEM;
	keyEnable <= EXMEMREGReadDigit_EXMEM;
	DataWriteFlag <= EXMEMREGWriteEnable_EXMEM;
	dataAD <= EXMEMREGR2Reg_EXMEM;
	toData <= EXMEMREGResult_EXMEM;
	printCode <= EXMEMREGR2Reg_EXMEM;
	printData <= EXMEMREGResult_EXMEM;
	regOUT <= RegisterFileOUTall & PCOutput;
	intstructionAD <= PCoutput;
	
end ProcessorLogic;