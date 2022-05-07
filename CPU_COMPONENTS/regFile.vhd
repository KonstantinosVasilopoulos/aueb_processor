library ieee;
use ieee.std_logic_1164.all;

entity regFile is
generic (n : integer := 16;
			k : integer := 3;
			regNum : integer := 8);
port (clock : in std_logic; 
	Write1 : in std_logic_vector (n-1 downto 0);
	Write1AD, Read1AD, Read2AD : in std_logic_vector(k-1 downto 0);
	Read1, Read2 : out std_logic_vector(n-1 downto 0);
	OUTall : out std_logic_vector(n*regNum-1 downto 0) 
	);
end regFile;

architecture regFileLogic of regFile is

component reg0 is
port (in1 : in std_logic_vector(n-1 downto 0); 
	clock, enable : in std_logic;
	out1 : out std_logic_vector(n-1 downto 0));
end component reg0;

component gen_reg is
port (in1 : in std_logic_vector(n-1 downto 0); 
	clock, enable : in std_logic;
	out1 : out std_logic_vector(n-1 downto 0));
end component gen_reg;

component decode3to8 is
port (in1: in std_logic_vector(k-1 downto 0);
    out1: out std_logic_vector(regNum-1 downto 0)
    );
end component decode3to8;

component mux8to1 is
port (in0, in1, in2, in3, in4, in5, in6, in7 : in std_logic_vector(n-1 downto 0); 
	choice : in std_logic_vector(k downto 0);
	out1 : out std_logic_vector(n-1 downto 0));
end component mux8to1;

signal enableSigs : std_logic_vector(regNum-1 downto 0);
signal re0, re1, re2, re3, re4, re5, re6, re7 : std_logic_vector(n-1 downto 0);

begin 

	G0: decode3to8 port map(Write1AD, enableSigs);
	
	G1: reg0 port map(Write1, enableSigs(0), Clock, re0);
	G2: gen_reg port map(Write1, enableSigs(0), Clock, re1);
	G3: gen_reg port map(Write1, enableSigs(0), Clock, re2);
	G4: gen_reg port map(Write1, enableSigs(0), Clock, re3);
	G5: gen_reg port map(Write1, enableSigs(0), Clock, re4);
	G6: gen_reg port map(Write1, enableSigs(0), Clock, re5);
	G7: gen_reg port map(Write1, enableSigs(0), Clock, re6);
	G8: gen_reg port map(Write1, enableSigs(0), Clock, re7);
	
	G9: mux8to1 port map(re0, re1, re2, re3, re4, re5, re6, re7, Read1AD, Read1);
	G10: mux8to1 port map(re0, re1, re2, re3, re4, re5, re6, re7, Read2AD, Read2);
	
	OUTall <= re7 & re6 & re5 & re4 & re3 & re2 & re1 & re0;
	
end regFileLogic;