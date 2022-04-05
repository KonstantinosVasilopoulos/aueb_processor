-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "04/05/2022 18:49:07"

-- 
-- Device: Altera EP2C35F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	SUB_16bit IS
    PORT (
	in1 : IN std_logic_vector(15 DOWNTO 0);
	in2 : IN std_logic_vector(15 DOWNTO 0);
	borrow_in : IN std_logic;
	diff : OUT std_logic_vector(15 DOWNTO 0);
	borrow_out : OUT std_logic
	);
END SUB_16bit;

-- Design Ports Information
-- diff[0]	=>  Location: PIN_W2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- diff[1]	=>  Location: PIN_V4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- diff[2]	=>  Location: PIN_T7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- diff[3]	=>  Location: PIN_V1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- diff[4]	=>  Location: PIN_A17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- diff[5]	=>  Location: PIN_F16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- diff[6]	=>  Location: PIN_F17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- diff[7]	=>  Location: PIN_G16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- diff[8]	=>  Location: PIN_H16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- diff[9]	=>  Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- diff[10]	=>  Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- diff[11]	=>  Location: PIN_J10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- diff[12]	=>  Location: PIN_J11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- diff[13]	=>  Location: PIN_J13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- diff[14]	=>  Location: PIN_G12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- diff[15]	=>  Location: PIN_J14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- borrow_out	=>  Location: PIN_E12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- borrow_in	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in1[0]	=>  Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in2[0]	=>  Location: PIN_V3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in1[1]	=>  Location: PIN_U3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in2[1]	=>  Location: PIN_V2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in1[2]	=>  Location: PIN_U9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in2[2]	=>  Location: PIN_U4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in1[3]	=>  Location: PIN_U6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in2[3]	=>  Location: PIN_T6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in1[4]	=>  Location: PIN_C17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in2[4]	=>  Location: PIN_F15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in1[5]	=>  Location: PIN_G17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in2[5]	=>  Location: PIN_H15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in1[6]	=>  Location: PIN_D17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in2[6]	=>  Location: PIN_A18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in1[7]	=>  Location: PIN_G15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in2[7]	=>  Location: PIN_B17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in1[8]	=>  Location: PIN_B18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in2[8]	=>  Location: PIN_H17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in1[9]	=>  Location: PIN_F13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in2[9]	=>  Location: PIN_A14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in1[10]	=>  Location: PIN_B12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in2[10]	=>  Location: PIN_F14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in1[11]	=>  Location: PIN_D14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in2[11]	=>  Location: PIN_D12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in1[12]	=>  Location: PIN_AE11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in2[12]	=>  Location: PIN_B14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in1[13]	=>  Location: PIN_C12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in2[13]	=>  Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in1[14]	=>  Location: PIN_C11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in2[14]	=>  Location: PIN_F12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in1[15]	=>  Location: PIN_G13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in2[15]	=>  Location: PIN_G14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF SUB_16bit IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_in1 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_in2 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_borrow_in : std_logic;
SIGNAL ww_diff : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_borrow_out : std_logic;
SIGNAL \borrow_in~combout\ : std_logic;
SIGNAL \S160|SO1|out1~combout\ : std_logic;
SIGNAL \S160|SO6|out1~combout\ : std_logic;
SIGNAL \S161|SO1|out1~combout\ : std_logic;
SIGNAL \S161|SO6|out1~combout\ : std_logic;
SIGNAL \S162|SO1|out1~combout\ : std_logic;
SIGNAL \S162|SO6|out1~0_combout\ : std_logic;
SIGNAL \S162|SO6|out1~1_combout\ : std_logic;
SIGNAL \S163|SO1|out1~combout\ : std_logic;
SIGNAL \S163|SO6|out1~combout\ : std_logic;
SIGNAL \S164|SO1|out1~combout\ : std_logic;
SIGNAL \S164|SO6|out1~combout\ : std_logic;
SIGNAL \S165|SO1|out1~combout\ : std_logic;
SIGNAL \S166|SO0|out1~combout\ : std_logic;
SIGNAL \S166|SO1|out1~combout\ : std_logic;
SIGNAL \S166|SO5|out1~combout\ : std_logic;
SIGNAL \S166|SO4|out1~combout\ : std_logic;
SIGNAL \S167|SO1|out1~combout\ : std_logic;
SIGNAL \S167|SO6|out1~combout\ : std_logic;
SIGNAL \S168|SO1|out1~combout\ : std_logic;
SIGNAL \S168|SO6|out1~combout\ : std_logic;
SIGNAL \S169|SO1|out1~combout\ : std_logic;
SIGNAL \S1610|SO0|out1~combout\ : std_logic;
SIGNAL \S1610|SO1|out1~combout\ : std_logic;
SIGNAL \S1610|SO5|out1~combout\ : std_logic;
SIGNAL \S1610|SO4|out1~combout\ : std_logic;
SIGNAL \S1611|SO1|out1~combout\ : std_logic;
SIGNAL \S1611|SO6|out1~combout\ : std_logic;
SIGNAL \S1612|SO1|out1~combout\ : std_logic;
SIGNAL \S1612|SO6|out1~combout\ : std_logic;
SIGNAL \S1613|SO1|out1~combout\ : std_logic;
SIGNAL \S1614|SO0|out1~combout\ : std_logic;
SIGNAL \S1614|SO1|out1~combout\ : std_logic;
SIGNAL \S1614|SO5|out1~combout\ : std_logic;
SIGNAL \S1614|SO4|out1~combout\ : std_logic;
SIGNAL \S1615|SO1|out1~combout\ : std_logic;
SIGNAL \S1615|SO6|out1~combout\ : std_logic;
SIGNAL \in2~combout\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \in1~combout\ : std_logic_vector(15 DOWNTO 0);

BEGIN

ww_in1 <= in1;
ww_in2 <= in2;
ww_borrow_in <= borrow_in;
diff <= ww_diff;
borrow_out <= ww_borrow_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\borrow_in~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_borrow_in,
	combout => \borrow_in~combout\);

-- Location: PIN_V3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in2[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in2(0),
	combout => \in2~combout\(0));

-- Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in1[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in1(0),
	combout => \in1~combout\(0));

-- Location: LCCOMB_X1_Y12_N24
\S160|SO1|out1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S160|SO1|out1~combout\ = \borrow_in~combout\ $ (\in2~combout\(0) $ (\in1~combout\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \borrow_in~combout\,
	datac => \in2~combout\(0),
	datad => \in1~combout\(0),
	combout => \S160|SO1|out1~combout\);

-- Location: PIN_U3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in1[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in1(1),
	combout => \in1~combout\(1));

-- Location: PIN_V2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in2[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in2(1),
	combout => \in2~combout\(1));

-- Location: LCCOMB_X1_Y12_N2
\S160|SO6|out1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S160|SO6|out1~combout\ = (\borrow_in~combout\ & ((\in2~combout\(0)) # (!\in1~combout\(0)))) # (!\borrow_in~combout\ & (\in2~combout\(0) & !\in1~combout\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \borrow_in~combout\,
	datac => \in2~combout\(0),
	datad => \in1~combout\(0),
	combout => \S160|SO6|out1~combout\);

-- Location: LCCOMB_X1_Y12_N20
\S161|SO1|out1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S161|SO1|out1~combout\ = \in1~combout\(1) $ (\in2~combout\(1) $ (\S160|SO6|out1~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \in1~combout\(1),
	datab => \in2~combout\(1),
	datad => \S160|SO6|out1~combout\,
	combout => \S161|SO1|out1~combout\);

-- Location: PIN_U4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in2[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in2(2),
	combout => \in2~combout\(2));

-- Location: PIN_U9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in1[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in1(2),
	combout => \in1~combout\(2));

-- Location: LCCOMB_X1_Y12_N6
\S161|SO6|out1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S161|SO6|out1~combout\ = (\in1~combout\(1) & (\in2~combout\(1) & \S160|SO6|out1~combout\)) # (!\in1~combout\(1) & ((\in2~combout\(1)) # (\S160|SO6|out1~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \in1~combout\(1),
	datab => \in2~combout\(1),
	datad => \S160|SO6|out1~combout\,
	combout => \S161|SO6|out1~combout\);

-- Location: LCCOMB_X1_Y12_N16
\S162|SO1|out1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S162|SO1|out1~combout\ = \in2~combout\(2) $ (\in1~combout\(2) $ (\S161|SO6|out1~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \in2~combout\(2),
	datac => \in1~combout\(2),
	datad => \S161|SO6|out1~combout\,
	combout => \S162|SO1|out1~combout\);

-- Location: PIN_U6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in1[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in1(3),
	combout => \in1~combout\(3));

-- Location: PIN_T6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in2[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in2(3),
	combout => \in2~combout\(3));

-- Location: LCCOMB_X1_Y12_N26
\S162|SO6|out1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \S162|SO6|out1~0_combout\ = (\in1~combout\(1) & (\in2~combout\(1) & \S160|SO6|out1~combout\)) # (!\in1~combout\(1) & ((\in2~combout\(1)) # (\S160|SO6|out1~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \in1~combout\(1),
	datab => \in2~combout\(1),
	datad => \S160|SO6|out1~combout\,
	combout => \S162|SO6|out1~0_combout\);

-- Location: LCCOMB_X1_Y12_N12
\S162|SO6|out1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S162|SO6|out1~1_combout\ = (\in2~combout\(2) & ((\S162|SO6|out1~0_combout\) # (!\in1~combout\(2)))) # (!\in2~combout\(2) & (!\in1~combout\(2) & \S162|SO6|out1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \in2~combout\(2),
	datac => \in1~combout\(2),
	datad => \S162|SO6|out1~0_combout\,
	combout => \S162|SO6|out1~1_combout\);

-- Location: LCCOMB_X1_Y12_N30
\S163|SO1|out1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S163|SO1|out1~combout\ = \in1~combout\(3) $ (\in2~combout\(3) $ (\S162|SO6|out1~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \in1~combout\(3),
	datac => \in2~combout\(3),
	datad => \S162|SO6|out1~1_combout\,
	combout => \S163|SO1|out1~combout\);

-- Location: LCCOMB_X1_Y12_N0
\S163|SO6|out1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S163|SO6|out1~combout\ = (\in1~combout\(3) & (\in2~combout\(3) & \S162|SO6|out1~1_combout\)) # (!\in1~combout\(3) & ((\in2~combout\(3)) # (\S162|SO6|out1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \in1~combout\(3),
	datac => \in2~combout\(3),
	datad => \S162|SO6|out1~1_combout\,
	combout => \S163|SO6|out1~combout\);

-- Location: PIN_F15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in2[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in2(4),
	combout => \in2~combout\(4));

-- Location: PIN_C17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in1[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in1(4),
	combout => \in1~combout\(4));

-- Location: LCCOMB_X45_Y35_N16
\S164|SO1|out1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S164|SO1|out1~combout\ = \S163|SO6|out1~combout\ $ (\in2~combout\(4) $ (\in1~combout\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \S163|SO6|out1~combout\,
	datab => \in2~combout\(4),
	datac => \in1~combout\(4),
	combout => \S164|SO1|out1~combout\);

-- Location: LCCOMB_X45_Y35_N26
\S164|SO6|out1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S164|SO6|out1~combout\ = (\S163|SO6|out1~combout\ & ((\in2~combout\(4)) # (!\in1~combout\(4)))) # (!\S163|SO6|out1~combout\ & (\in2~combout\(4) & !\in1~combout\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111010001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \S163|SO6|out1~combout\,
	datab => \in2~combout\(4),
	datac => \in1~combout\(4),
	combout => \S164|SO6|out1~combout\);

-- Location: PIN_H15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in2[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in2(5),
	combout => \in2~combout\(5));

-- Location: PIN_G17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in1[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in1(5),
	combout => \in1~combout\(5));

-- Location: LCCOMB_X45_Y35_N12
\S165|SO1|out1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S165|SO1|out1~combout\ = \S164|SO6|out1~combout\ $ (\in2~combout\(5) $ (\in1~combout\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \S164|SO6|out1~combout\,
	datac => \in2~combout\(5),
	datad => \in1~combout\(5),
	combout => \S165|SO1|out1~combout\);

-- Location: PIN_D17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in1[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in1(6),
	combout => \in1~combout\(6));

-- Location: PIN_A18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in2[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in2(6),
	combout => \in2~combout\(6));

-- Location: LCCOMB_X45_Y35_N6
\S166|SO0|out1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S166|SO0|out1~combout\ = \in1~combout\(6) $ (\in2~combout\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \in1~combout\(6),
	datad => \in2~combout\(6),
	combout => \S166|SO0|out1~combout\);

-- Location: LCCOMB_X45_Y35_N0
\S166|SO1|out1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S166|SO1|out1~combout\ = \S166|SO0|out1~combout\ $ (((\S164|SO6|out1~combout\ & ((\in2~combout\(5)) # (!\in1~combout\(5)))) # (!\S164|SO6|out1~combout\ & (\in2~combout\(5) & !\in1~combout\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101001010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \S166|SO0|out1~combout\,
	datab => \S164|SO6|out1~combout\,
	datac => \in2~combout\(5),
	datad => \in1~combout\(5),
	combout => \S166|SO1|out1~combout\);

-- Location: LCCOMB_X45_Y35_N20
\S166|SO5|out1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S166|SO5|out1~combout\ = (!\S166|SO0|out1~combout\ & ((\S164|SO6|out1~combout\ & ((\in2~combout\(5)) # (!\in1~combout\(5)))) # (!\S164|SO6|out1~combout\ & (\in2~combout\(5) & !\in1~combout\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \S166|SO0|out1~combout\,
	datab => \S164|SO6|out1~combout\,
	datac => \in2~combout\(5),
	datad => \in1~combout\(5),
	combout => \S166|SO5|out1~combout\);

-- Location: PIN_G15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in1[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in1(7),
	combout => \in1~combout\(7));

-- Location: PIN_B17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in2[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in2(7),
	combout => \in2~combout\(7));

-- Location: LCCOMB_X45_Y35_N2
\S166|SO4|out1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S166|SO4|out1~combout\ = (!\in1~combout\(6) & \in2~combout\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \in1~combout\(6),
	datad => \in2~combout\(6),
	combout => \S166|SO4|out1~combout\);

-- Location: LCCOMB_X45_Y35_N22
\S167|SO1|out1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S167|SO1|out1~combout\ = \in1~combout\(7) $ (\in2~combout\(7) $ (((\S166|SO5|out1~combout\) # (\S166|SO4|out1~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \S166|SO5|out1~combout\,
	datab => \in1~combout\(7),
	datac => \in2~combout\(7),
	datad => \S166|SO4|out1~combout\,
	combout => \S167|SO1|out1~combout\);

-- Location: PIN_B18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in1[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in1(8),
	combout => \in1~combout\(8));

-- Location: LCCOMB_X45_Y35_N24
\S167|SO6|out1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S167|SO6|out1~combout\ = (\in1~combout\(7) & (\in2~combout\(7) & ((\S166|SO5|out1~combout\) # (\S166|SO4|out1~combout\)))) # (!\in1~combout\(7) & ((\S166|SO5|out1~combout\) # ((\in2~combout\(7)) # (\S166|SO4|out1~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \S166|SO5|out1~combout\,
	datab => \in1~combout\(7),
	datac => \in2~combout\(7),
	datad => \S166|SO4|out1~combout\,
	combout => \S167|SO6|out1~combout\);

-- Location: PIN_H17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in2[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in2(8),
	combout => \in2~combout\(8));

-- Location: LCCOMB_X45_Y35_N18
\S168|SO1|out1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S168|SO1|out1~combout\ = \in1~combout\(8) $ (\S167|SO6|out1~combout\ $ (\in2~combout\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \in1~combout\(8),
	datac => \S167|SO6|out1~combout\,
	datad => \in2~combout\(8),
	combout => \S168|SO1|out1~combout\);

-- Location: PIN_F13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in1[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in1(9),
	combout => \in1~combout\(9));

-- Location: PIN_A14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in2[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in2(9),
	combout => \in2~combout\(9));

-- Location: LCCOMB_X45_Y35_N28
\S168|SO6|out1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S168|SO6|out1~combout\ = (\in1~combout\(8) & (\S167|SO6|out1~combout\ & \in2~combout\(8))) # (!\in1~combout\(8) & ((\S167|SO6|out1~combout\) # (\in2~combout\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \in1~combout\(8),
	datac => \S167|SO6|out1~combout\,
	datad => \in2~combout\(8),
	combout => \S168|SO6|out1~combout\);

-- Location: LCCOMB_X28_Y35_N16
\S169|SO1|out1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S169|SO1|out1~combout\ = \in1~combout\(9) $ (\in2~combout\(9) $ (\S168|SO6|out1~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \in1~combout\(9),
	datac => \in2~combout\(9),
	datad => \S168|SO6|out1~combout\,
	combout => \S169|SO1|out1~combout\);

-- Location: PIN_B12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in1[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in1(10),
	combout => \in1~combout\(10));

-- Location: PIN_F14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in2[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in2(10),
	combout => \in2~combout\(10));

-- Location: LCCOMB_X28_Y35_N2
\S1610|SO0|out1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S1610|SO0|out1~combout\ = \in1~combout\(10) $ (\in2~combout\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \in1~combout\(10),
	datad => \in2~combout\(10),
	combout => \S1610|SO0|out1~combout\);

-- Location: LCCOMB_X28_Y35_N4
\S1610|SO1|out1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S1610|SO1|out1~combout\ = \S1610|SO0|out1~combout\ $ (((\in1~combout\(9) & (\in2~combout\(9) & \S168|SO6|out1~combout\)) # (!\in1~combout\(9) & ((\in2~combout\(9)) # (\S168|SO6|out1~combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011100110011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \in1~combout\(9),
	datab => \S1610|SO0|out1~combout\,
	datac => \in2~combout\(9),
	datad => \S168|SO6|out1~combout\,
	combout => \S1610|SO1|out1~combout\);

-- Location: PIN_D14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in1[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in1(11),
	combout => \in1~combout\(11));

-- Location: LCCOMB_X28_Y35_N8
\S1610|SO5|out1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S1610|SO5|out1~combout\ = (!\S1610|SO0|out1~combout\ & ((\in1~combout\(9) & (\in2~combout\(9) & \S168|SO6|out1~combout\)) # (!\in1~combout\(9) & ((\in2~combout\(9)) # (\S168|SO6|out1~combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \in1~combout\(9),
	datab => \S1610|SO0|out1~combout\,
	datac => \in2~combout\(9),
	datad => \S168|SO6|out1~combout\,
	combout => \S1610|SO5|out1~combout\);

-- Location: PIN_D12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in2[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in2(11),
	combout => \in2~combout\(11));

-- Location: LCCOMB_X28_Y35_N30
\S1610|SO4|out1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S1610|SO4|out1~combout\ = (!\in1~combout\(10) & \in2~combout\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \in1~combout\(10),
	datad => \in2~combout\(10),
	combout => \S1610|SO4|out1~combout\);

-- Location: LCCOMB_X28_Y35_N18
\S1611|SO1|out1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S1611|SO1|out1~combout\ = \in1~combout\(11) $ (\in2~combout\(11) $ (((\S1610|SO5|out1~combout\) # (\S1610|SO4|out1~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \in1~combout\(11),
	datab => \S1610|SO5|out1~combout\,
	datac => \in2~combout\(11),
	datad => \S1610|SO4|out1~combout\,
	combout => \S1611|SO1|out1~combout\);

-- Location: LCCOMB_X28_Y35_N12
\S1611|SO6|out1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S1611|SO6|out1~combout\ = (\in1~combout\(11) & (\in2~combout\(11) & ((\S1610|SO5|out1~combout\) # (\S1610|SO4|out1~combout\)))) # (!\in1~combout\(11) & ((\S1610|SO5|out1~combout\) # ((\in2~combout\(11)) # (\S1610|SO4|out1~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \in1~combout\(11),
	datab => \S1610|SO5|out1~combout\,
	datac => \in2~combout\(11),
	datad => \S1610|SO4|out1~combout\,
	combout => \S1611|SO6|out1~combout\);

-- Location: PIN_B14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in2[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in2(12),
	combout => \in2~combout\(12));

-- Location: PIN_AE11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in1[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in1(12),
	combout => \in1~combout\(12));

-- Location: LCCOMB_X28_Y35_N6
\S1612|SO1|out1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S1612|SO1|out1~combout\ = \S1611|SO6|out1~combout\ $ (\in2~combout\(12) $ (\in1~combout\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \S1611|SO6|out1~combout\,
	datab => \in2~combout\(12),
	datac => \in1~combout\(12),
	combout => \S1612|SO1|out1~combout\);

-- Location: PIN_C12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in1[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in1(13),
	combout => \in1~combout\(13));

-- Location: LCCOMB_X28_Y35_N0
\S1612|SO6|out1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S1612|SO6|out1~combout\ = (\S1611|SO6|out1~combout\ & ((\in2~combout\(12)) # (!\in1~combout\(12)))) # (!\S1611|SO6|out1~combout\ & (\in2~combout\(12) & !\in1~combout\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111010001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \S1611|SO6|out1~combout\,
	datab => \in2~combout\(12),
	datac => \in1~combout\(12),
	combout => \S1612|SO6|out1~combout\);

-- Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in2[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in2(13),
	combout => \in2~combout\(13));

-- Location: LCCOMB_X28_Y35_N26
\S1613|SO1|out1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S1613|SO1|out1~combout\ = \in1~combout\(13) $ (\S1612|SO6|out1~combout\ $ (\in2~combout\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \in1~combout\(13),
	datab => \S1612|SO6|out1~combout\,
	datac => \in2~combout\(13),
	combout => \S1613|SO1|out1~combout\);

-- Location: PIN_F12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in2[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in2(14),
	combout => \in2~combout\(14));

-- Location: PIN_C11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in1[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in1(14),
	combout => \in1~combout\(14));

-- Location: LCCOMB_X28_Y35_N28
\S1614|SO0|out1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S1614|SO0|out1~combout\ = \in2~combout\(14) $ (\in1~combout\(14))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \in2~combout\(14),
	datad => \in1~combout\(14),
	combout => \S1614|SO0|out1~combout\);

-- Location: LCCOMB_X28_Y35_N14
\S1614|SO1|out1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S1614|SO1|out1~combout\ = \S1614|SO0|out1~combout\ $ (((\in1~combout\(13) & (\in2~combout\(13) & \S1612|SO6|out1~combout\)) # (!\in1~combout\(13) & ((\in2~combout\(13)) # (\S1612|SO6|out1~combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011100110011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \in1~combout\(13),
	datab => \S1614|SO0|out1~combout\,
	datac => \in2~combout\(13),
	datad => \S1612|SO6|out1~combout\,
	combout => \S1614|SO1|out1~combout\);

-- Location: LCCOMB_X28_Y35_N10
\S1614|SO5|out1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S1614|SO5|out1~combout\ = (!\S1614|SO0|out1~combout\ & ((\in1~combout\(13) & (\in2~combout\(13) & \S1612|SO6|out1~combout\)) # (!\in1~combout\(13) & ((\in2~combout\(13)) # (\S1612|SO6|out1~combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \in1~combout\(13),
	datab => \S1614|SO0|out1~combout\,
	datac => \in2~combout\(13),
	datad => \S1612|SO6|out1~combout\,
	combout => \S1614|SO5|out1~combout\);

-- Location: PIN_G13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in1[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in1(15),
	combout => \in1~combout\(15));

-- Location: LCCOMB_X28_Y35_N24
\S1614|SO4|out1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S1614|SO4|out1~combout\ = (\in2~combout\(14) & !\in1~combout\(14))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \in2~combout\(14),
	datad => \in1~combout\(14),
	combout => \S1614|SO4|out1~combout\);

-- Location: PIN_G14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in2[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in2(15),
	combout => \in2~combout\(15));

-- Location: LCCOMB_X28_Y35_N20
\S1615|SO1|out1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S1615|SO1|out1~combout\ = \in1~combout\(15) $ (\in2~combout\(15) $ (((\S1614|SO5|out1~combout\) # (\S1614|SO4|out1~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100100110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \S1614|SO5|out1~combout\,
	datab => \in1~combout\(15),
	datac => \S1614|SO4|out1~combout\,
	datad => \in2~combout\(15),
	combout => \S1615|SO1|out1~combout\);

-- Location: LCCOMB_X28_Y35_N22
\S1615|SO6|out1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S1615|SO6|out1~combout\ = (\in1~combout\(15) & (\in2~combout\(15) & ((\S1614|SO5|out1~combout\) # (\S1614|SO4|out1~combout\)))) # (!\in1~combout\(15) & ((\S1614|SO5|out1~combout\) # ((\S1614|SO4|out1~combout\) # (\in2~combout\(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101100110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \S1614|SO5|out1~combout\,
	datab => \in1~combout\(15),
	datac => \S1614|SO4|out1~combout\,
	datad => \in2~combout\(15),
	combout => \S1615|SO6|out1~combout\);

-- Location: PIN_W2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\diff[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \S160|SO1|out1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_diff(0));

-- Location: PIN_V4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\diff[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \S161|SO1|out1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_diff(1));

-- Location: PIN_T7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\diff[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \S162|SO1|out1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_diff(2));

-- Location: PIN_V1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\diff[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \S163|SO1|out1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_diff(3));

-- Location: PIN_A17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\diff[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \S164|SO1|out1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_diff(4));

-- Location: PIN_F16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\diff[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \S165|SO1|out1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_diff(5));

-- Location: PIN_F17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\diff[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \S166|SO1|out1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_diff(6));

-- Location: PIN_G16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\diff[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \S167|SO1|out1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_diff(7));

-- Location: PIN_H16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\diff[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \S168|SO1|out1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_diff(8));

-- Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\diff[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \S169|SO1|out1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_diff(9));

-- Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\diff[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \S1610|SO1|out1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_diff(10));

-- Location: PIN_J10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\diff[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \S1611|SO1|out1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_diff(11));

-- Location: PIN_J11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\diff[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \S1612|SO1|out1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_diff(12));

-- Location: PIN_J13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\diff[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \S1613|SO1|out1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_diff(13));

-- Location: PIN_G12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\diff[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \S1614|SO1|out1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_diff(14));

-- Location: PIN_J14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\diff[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \S1615|SO1|out1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_diff(15));

-- Location: PIN_E12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\borrow_out~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \S1615|SO6|out1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_borrow_out);
END structure;


