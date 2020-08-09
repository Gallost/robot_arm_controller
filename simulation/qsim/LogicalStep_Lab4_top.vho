-- Copyright (C) 2019  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition"

-- DATE "07/29/2020 14:17:54"

-- 
-- Device: Altera 10M08DAF484C8G Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	LogicalStep_Lab4_top IS
    PORT (
	Clk : IN std_logic;
	rst_n : IN std_logic;
	pb : IN std_logic_vector(3 DOWNTO 0);
	sw : IN std_logic_vector(7 DOWNTO 0);
	leds : BUFFER std_logic_vector(15 DOWNTO 0)
	);
END LogicalStep_Lab4_top;

ARCHITECTURE structure OF LogicalStep_Lab4_top IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Clk : std_logic;
SIGNAL ww_rst_n : std_logic;
SIGNAL ww_pb : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_sw : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_leds : std_logic_vector(15 DOWNTO 0);
SIGNAL \pb[3]~input_o\ : std_logic;
SIGNAL \leds[0]~output_o\ : std_logic;
SIGNAL \leds[1]~output_o\ : std_logic;
SIGNAL \leds[2]~output_o\ : std_logic;
SIGNAL \leds[3]~output_o\ : std_logic;
SIGNAL \leds[4]~output_o\ : std_logic;
SIGNAL \leds[5]~output_o\ : std_logic;
SIGNAL \leds[6]~output_o\ : std_logic;
SIGNAL \leds[7]~output_o\ : std_logic;
SIGNAL \leds[8]~output_o\ : std_logic;
SIGNAL \leds[9]~output_o\ : std_logic;
SIGNAL \leds[10]~output_o\ : std_logic;
SIGNAL \leds[11]~output_o\ : std_logic;
SIGNAL \leds[12]~output_o\ : std_logic;
SIGNAL \leds[13]~output_o\ : std_logic;
SIGNAL \leds[14]~output_o\ : std_logic;
SIGNAL \leds[15]~output_o\ : std_logic;
SIGNAL \Clk~input_o\ : std_logic;
SIGNAL \rst_n~input_o\ : std_logic;
SIGNAL \inst_extension_controller|ext_shift~1_combout\ : std_logic;
SIGNAL \pb[2]~input_o\ : std_logic;
SIGNAL \inst_motion_controller|r0~q\ : std_logic;
SIGNAL \inst_motion_controller|r1~q\ : std_logic;
SIGNAL \inst_motion_controller|enable_y_out~0_combout\ : std_logic;
SIGNAL \inst_motion_controller|enable_y_out~1_combout\ : std_logic;
SIGNAL \sw[7]~input_o\ : std_logic;
SIGNAL \sw[3]~input_o\ : std_logic;
SIGNAL \sw[2]~input_o\ : std_logic;
SIGNAL \inst_counter_y|ud_bin_counter[1]~7_cout\ : std_logic;
SIGNAL \inst_counter_y|ud_bin_counter[1]~8_combout\ : std_logic;
SIGNAL \inst_counter_y|ud_bin_counter[1]~9\ : std_logic;
SIGNAL \inst_counter_y|ud_bin_counter[2]~11\ : std_logic;
SIGNAL \inst_counter_y|ud_bin_counter[3]~12_combout\ : std_logic;
SIGNAL \inst_compare_y|agtb_4bit~1_combout\ : std_logic;
SIGNAL \sw[1]~input_o\ : std_logic;
SIGNAL \sw[0]~input_o\ : std_logic;
SIGNAL \inst_compare_y|agtb_4bit~2_combout\ : std_logic;
SIGNAL \inst_compare_y|agtb_4bit~3_combout\ : std_logic;
SIGNAL \inst_counter_y|process_0~0_combout\ : std_logic;
SIGNAL \inst_counter_y|process_0~1_combout\ : std_logic;
SIGNAL \inst_counter_y|ud_bin_counter[2]~10_combout\ : std_logic;
SIGNAL \inst_compare_y|agtb_4bit~0_combout\ : std_logic;
SIGNAL \inst_motion_controller|enable_y_out~2_combout\ : std_logic;
SIGNAL \inst_counter_y|ud_bin_counter~3_combout\ : std_logic;
SIGNAL \inst_counter_y|ud_bin_counter~4_combout\ : std_logic;
SIGNAL \inst_counter_y|ud_bin_counter[0]~5_combout\ : std_logic;
SIGNAL \inst_compare_y|aeqb_4bit~0_combout\ : std_logic;
SIGNAL \inst_compare_y|aeqb_4bit~combout\ : std_logic;
SIGNAL \inst_motion_controller|x_tgt[3]~0_combout\ : std_logic;
SIGNAL \inst_motion_controller|y_que[0]~0_combout\ : std_logic;
SIGNAL \sw[6]~input_o\ : std_logic;
SIGNAL \inst_counter_x|ud_bin_counter[1]~7_cout\ : std_logic;
SIGNAL \inst_counter_x|ud_bin_counter[1]~8_combout\ : std_logic;
SIGNAL \inst_counter_x|ud_bin_counter[1]~9\ : std_logic;
SIGNAL \inst_counter_x|ud_bin_counter[2]~11\ : std_logic;
SIGNAL \inst_counter_x|ud_bin_counter[3]~12_combout\ : std_logic;
SIGNAL \inst_compare_x|agtb_4bit~1_combout\ : std_logic;
SIGNAL \sw[5]~input_o\ : std_logic;
SIGNAL \sw[4]~input_o\ : std_logic;
SIGNAL \inst_compare_x|agtb_4bit~2_combout\ : std_logic;
SIGNAL \inst_compare_x|agtb_4bit~3_combout\ : std_logic;
SIGNAL \inst_counter_x|process_0~0_combout\ : std_logic;
SIGNAL \inst_counter_x|process_0~1_combout\ : std_logic;
SIGNAL \inst_counter_x|ud_bin_counter[2]~10_combout\ : std_logic;
SIGNAL \inst_compare_x|agtb_4bit~0_combout\ : std_logic;
SIGNAL \inst_motion_controller|enable_x_out~0_combout\ : std_logic;
SIGNAL \inst_counter_x|ud_bin_counter~3_combout\ : std_logic;
SIGNAL \inst_counter_x|ud_bin_counter~4_combout\ : std_logic;
SIGNAL \inst_counter_x|ud_bin_counter[0]~5_combout\ : std_logic;
SIGNAL \inst_compare_x|aeqb_4bit~0_combout\ : std_logic;
SIGNAL \inst_motion_controller|decoder_section~0_combout\ : std_logic;
SIGNAL \inst_motion_controller|decoder_section~1_combout\ : std_logic;
SIGNAL \inst_motion_controller|back_to_idle~0_combout\ : std_logic;
SIGNAL \inst_motion_controller|back_to_idle~combout\ : std_logic;
SIGNAL \inst_motion_controller|next_state~0_combout\ : std_logic;
SIGNAL \inst_motion_controller|current_state~q\ : std_logic;
SIGNAL \inst_motion_controller|en_ext~combout\ : std_logic;
SIGNAL \pb[1]~input_o\ : std_logic;
SIGNAL \inst_extension_controller|r0~q\ : std_logic;
SIGNAL \inst_extension_controller|r1~q\ : std_logic;
SIGNAL \inst_extension_controller|grapple~0_combout\ : std_logic;
SIGNAL \inst_extension_controller|ext_shift~2_combout\ : std_logic;
SIGNAL \inst_extension_controller|ext_shift~3_combout\ : std_logic;
SIGNAL \inst_extension_controller|ext_shift~combout\ : std_logic;
SIGNAL \inst_extend_shifter|sreg~3_combout\ : std_logic;
SIGNAL \inst_extension_controller|ext_en~0_combout\ : std_logic;
SIGNAL \inst_extension_controller|ext_en~combout\ : std_logic;
SIGNAL \inst_extend_shifter|sreg~2_combout\ : std_logic;
SIGNAL \inst_extend_shifter|sreg~1_combout\ : std_logic;
SIGNAL \inst_extend_shifter|sreg~0_combout\ : std_logic;
SIGNAL \inst_extension_controller|ext_shift~0_combout\ : std_logic;
SIGNAL \inst_extension_controller|ext_stat~0_combout\ : std_logic;
SIGNAL \inst_extension_controller|ext_stat~combout\ : std_logic;
SIGNAL \inst_motion_controller|sys_fault~combout\ : std_logic;
SIGNAL \pb[0]~input_o\ : std_logic;
SIGNAL \inst_grapple_controller|r0~q\ : std_logic;
SIGNAL \inst_extension_controller|grapple~1_combout\ : std_logic;
SIGNAL \inst_extension_controller|grapple~combout\ : std_logic;
SIGNAL \inst_grapple_controller|r1~q\ : std_logic;
SIGNAL \inst_grapple_controller|grp_stat~0_combout\ : std_logic;
SIGNAL \inst_grapple_controller|grp_stat~q\ : std_logic;
SIGNAL \inst_counter_y|ud_bin_counter\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst_motion_controller|x_que\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst_counter_x|ud_bin_counter\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst_extend_shifter|sreg\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst_motion_controller|y_tgt\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst_motion_controller|x_tgt\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst_motion_controller|y_que\ : std_logic_vector(3 DOWNTO 0);

BEGIN

ww_Clk <= Clk;
ww_rst_n <= rst_n;
ww_pb <= pb;
ww_sw <= sw;
leds <= ww_leds;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\leds[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_motion_controller|sys_fault~combout\,
	devoe => ww_devoe,
	o => \leds[0]~output_o\);

\leds[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_extension_controller|ext_stat~combout\,
	devoe => ww_devoe,
	o => \leds[1]~output_o\);

\leds[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \leds[2]~output_o\);

\leds[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_grapple_controller|grp_stat~q\,
	devoe => ww_devoe,
	o => \leds[3]~output_o\);

\leds[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_extend_shifter|sreg\(0),
	devoe => ww_devoe,
	o => \leds[4]~output_o\);

\leds[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_extend_shifter|sreg\(1),
	devoe => ww_devoe,
	o => \leds[5]~output_o\);

\leds[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_extend_shifter|sreg\(2),
	devoe => ww_devoe,
	o => \leds[6]~output_o\);

\leds[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_extend_shifter|sreg\(3),
	devoe => ww_devoe,
	o => \leds[7]~output_o\);

\leds[8]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_counter_y|ud_bin_counter\(0),
	devoe => ww_devoe,
	o => \leds[8]~output_o\);

\leds[9]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_counter_y|ud_bin_counter\(1),
	devoe => ww_devoe,
	o => \leds[9]~output_o\);

\leds[10]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_counter_y|ud_bin_counter\(2),
	devoe => ww_devoe,
	o => \leds[10]~output_o\);

\leds[11]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_counter_y|ud_bin_counter\(3),
	devoe => ww_devoe,
	o => \leds[11]~output_o\);

\leds[12]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_counter_x|ud_bin_counter\(0),
	devoe => ww_devoe,
	o => \leds[12]~output_o\);

\leds[13]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_counter_x|ud_bin_counter\(1),
	devoe => ww_devoe,
	o => \leds[13]~output_o\);

\leds[14]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_counter_x|ud_bin_counter\(2),
	devoe => ww_devoe,
	o => \leds[14]~output_o\);

\leds[15]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_counter_x|ud_bin_counter\(3),
	devoe => ww_devoe,
	o => \leds[15]~output_o\);

\Clk~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Clk,
	o => \Clk~input_o\);

\rst_n~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst_n,
	o => \rst_n~input_o\);

\inst_extension_controller|ext_shift~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_extension_controller|ext_shift~1_combout\ = (\rst_n~input_o\ & \inst_extension_controller|ext_shift~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst_n~input_o\,
	datab => \inst_extension_controller|ext_shift~0_combout\,
	combout => \inst_extension_controller|ext_shift~1_combout\);

\pb[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pb(2),
	o => \pb[2]~input_o\);

\inst_motion_controller|r0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~input_o\,
	d => \pb[2]~input_o\,
	clrn => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_motion_controller|r0~q\);

\inst_motion_controller|r1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~input_o\,
	d => \inst_motion_controller|r0~q\,
	clrn => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_motion_controller|r1~q\);

\inst_motion_controller|enable_y_out~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_motion_controller|enable_y_out~0_combout\ = (\rst_n~input_o\ & (\inst_motion_controller|r1~q\ & (!\inst_motion_controller|current_state~q\ & !\inst_motion_controller|r0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst_n~input_o\,
	datab => \inst_motion_controller|r1~q\,
	datac => \inst_motion_controller|current_state~q\,
	datad => \inst_motion_controller|r0~q\,
	combout => \inst_motion_controller|enable_y_out~0_combout\);

\inst_motion_controller|enable_y_out~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_motion_controller|enable_y_out~1_combout\ = (\inst_motion_controller|current_state~q\ & (\rst_n~input_o\ & !\inst_extension_controller|ext_stat~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_motion_controller|current_state~q\,
	datab => \rst_n~input_o\,
	datad => \inst_extension_controller|ext_stat~combout\,
	combout => \inst_motion_controller|enable_y_out~1_combout\);

\sw[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(7),
	o => \sw[7]~input_o\);

\sw[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(3),
	o => \sw[3]~input_o\);

\inst_motion_controller|y_que[3]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_motion_controller|y_que\(3) = (\rst_n~input_o\ & ((\inst_motion_controller|y_que[0]~0_combout\ & (\sw[3]~input_o\)) # (!\inst_motion_controller|y_que[0]~0_combout\ & ((\inst_motion_controller|y_que\(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw[3]~input_o\,
	datab => \inst_motion_controller|y_que\(3),
	datac => \inst_motion_controller|y_que[0]~0_combout\,
	datad => \rst_n~input_o\,
	combout => \inst_motion_controller|y_que\(3));

\inst_motion_controller|y_tgt[3]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_motion_controller|y_tgt\(3) = (\rst_n~input_o\ & ((\inst_motion_controller|x_tgt[3]~0_combout\ & (\inst_motion_controller|y_que\(3))) # (!\inst_motion_controller|x_tgt[3]~0_combout\ & ((\inst_motion_controller|y_tgt\(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_motion_controller|y_que\(3),
	datab => \inst_motion_controller|y_tgt\(3),
	datac => \inst_motion_controller|x_tgt[3]~0_combout\,
	datad => \rst_n~input_o\,
	combout => \inst_motion_controller|y_tgt\(3));

\sw[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(2),
	o => \sw[2]~input_o\);

\inst_motion_controller|y_que[2]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_motion_controller|y_que\(2) = (\rst_n~input_o\ & ((\inst_motion_controller|y_que[0]~0_combout\ & (\sw[2]~input_o\)) # (!\inst_motion_controller|y_que[0]~0_combout\ & ((\inst_motion_controller|y_que\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw[2]~input_o\,
	datab => \inst_motion_controller|y_que\(2),
	datac => \inst_motion_controller|y_que[0]~0_combout\,
	datad => \rst_n~input_o\,
	combout => \inst_motion_controller|y_que\(2));

\inst_motion_controller|y_tgt[2]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_motion_controller|y_tgt\(2) = (\rst_n~input_o\ & ((\inst_motion_controller|x_tgt[3]~0_combout\ & (\inst_motion_controller|y_que\(2))) # (!\inst_motion_controller|x_tgt[3]~0_combout\ & ((\inst_motion_controller|y_tgt\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_motion_controller|y_que\(2),
	datab => \inst_motion_controller|y_tgt\(2),
	datac => \inst_motion_controller|x_tgt[3]~0_combout\,
	datad => \rst_n~input_o\,
	combout => \inst_motion_controller|y_tgt\(2));

\inst_counter_y|ud_bin_counter[1]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_counter_y|ud_bin_counter[1]~7_cout\ = CARRY(\inst_counter_y|ud_bin_counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter_y|ud_bin_counter\(0),
	datad => VCC,
	cout => \inst_counter_y|ud_bin_counter[1]~7_cout\);

\inst_counter_y|ud_bin_counter[1]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_counter_y|ud_bin_counter[1]~8_combout\ = (\inst_counter_y|ud_bin_counter\(1) & ((\inst_counter_y|process_0~1_combout\ & (!\inst_counter_y|ud_bin_counter[1]~7_cout\)) # (!\inst_counter_y|process_0~1_combout\ & 
-- (\inst_counter_y|ud_bin_counter[1]~7_cout\ & VCC)))) # (!\inst_counter_y|ud_bin_counter\(1) & ((\inst_counter_y|process_0~1_combout\ & ((\inst_counter_y|ud_bin_counter[1]~7_cout\) # (GND))) # (!\inst_counter_y|process_0~1_combout\ & 
-- (!\inst_counter_y|ud_bin_counter[1]~7_cout\))))
-- \inst_counter_y|ud_bin_counter[1]~9\ = CARRY((\inst_counter_y|ud_bin_counter\(1) & (\inst_counter_y|process_0~1_combout\ & !\inst_counter_y|ud_bin_counter[1]~7_cout\)) # (!\inst_counter_y|ud_bin_counter\(1) & ((\inst_counter_y|process_0~1_combout\) # 
-- (!\inst_counter_y|ud_bin_counter[1]~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter_y|ud_bin_counter\(1),
	datab => \inst_counter_y|process_0~1_combout\,
	datad => VCC,
	cin => \inst_counter_y|ud_bin_counter[1]~7_cout\,
	combout => \inst_counter_y|ud_bin_counter[1]~8_combout\,
	cout => \inst_counter_y|ud_bin_counter[1]~9\);

\inst_counter_y|ud_bin_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~input_o\,
	d => \inst_counter_y|ud_bin_counter[1]~8_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_counter_y|ud_bin_counter~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_counter_y|ud_bin_counter\(1));

\inst_counter_y|ud_bin_counter[2]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_counter_y|ud_bin_counter[2]~10_combout\ = ((\inst_counter_y|ud_bin_counter\(2) $ (\inst_counter_y|process_0~1_combout\ $ (\inst_counter_y|ud_bin_counter[1]~9\)))) # (GND)
-- \inst_counter_y|ud_bin_counter[2]~11\ = CARRY((\inst_counter_y|ud_bin_counter\(2) & ((!\inst_counter_y|ud_bin_counter[1]~9\) # (!\inst_counter_y|process_0~1_combout\))) # (!\inst_counter_y|ud_bin_counter\(2) & (!\inst_counter_y|process_0~1_combout\ & 
-- !\inst_counter_y|ud_bin_counter[1]~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter_y|ud_bin_counter\(2),
	datab => \inst_counter_y|process_0~1_combout\,
	datad => VCC,
	cin => \inst_counter_y|ud_bin_counter[1]~9\,
	combout => \inst_counter_y|ud_bin_counter[2]~10_combout\,
	cout => \inst_counter_y|ud_bin_counter[2]~11\);

\inst_counter_y|ud_bin_counter[3]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_counter_y|ud_bin_counter[3]~12_combout\ = \inst_counter_y|ud_bin_counter\(3) $ (\inst_counter_y|process_0~1_combout\ $ (!\inst_counter_y|ud_bin_counter[2]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101101001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter_y|ud_bin_counter\(3),
	datab => \inst_counter_y|process_0~1_combout\,
	cin => \inst_counter_y|ud_bin_counter[2]~11\,
	combout => \inst_counter_y|ud_bin_counter[3]~12_combout\);

\inst_counter_y|ud_bin_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~input_o\,
	d => \inst_counter_y|ud_bin_counter[3]~12_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_counter_y|ud_bin_counter~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_counter_y|ud_bin_counter\(3));

\inst_compare_y|agtb_4bit~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_compare_y|agtb_4bit~1_combout\ = (\inst_motion_controller|y_tgt\(3) & (((\inst_motion_controller|y_tgt\(2) & !\inst_counter_y|ud_bin_counter\(2))) # (!\inst_counter_y|ud_bin_counter\(3)))) # (!\inst_motion_controller|y_tgt\(3) & 
-- (\inst_motion_controller|y_tgt\(2) & (!\inst_counter_y|ud_bin_counter\(2) & !\inst_counter_y|ud_bin_counter\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_motion_controller|y_tgt\(3),
	datab => \inst_motion_controller|y_tgt\(2),
	datac => \inst_counter_y|ud_bin_counter\(2),
	datad => \inst_counter_y|ud_bin_counter\(3),
	combout => \inst_compare_y|agtb_4bit~1_combout\);

\sw[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(1),
	o => \sw[1]~input_o\);

\inst_motion_controller|y_que[1]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_motion_controller|y_que\(1) = (\rst_n~input_o\ & ((\inst_motion_controller|y_que[0]~0_combout\ & (\sw[1]~input_o\)) # (!\inst_motion_controller|y_que[0]~0_combout\ & ((\inst_motion_controller|y_que\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw[1]~input_o\,
	datab => \inst_motion_controller|y_que\(1),
	datac => \inst_motion_controller|y_que[0]~0_combout\,
	datad => \rst_n~input_o\,
	combout => \inst_motion_controller|y_que\(1));

\inst_motion_controller|y_tgt[1]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_motion_controller|y_tgt\(1) = (\rst_n~input_o\ & ((\inst_motion_controller|x_tgt[3]~0_combout\ & (\inst_motion_controller|y_que\(1))) # (!\inst_motion_controller|x_tgt[3]~0_combout\ & ((\inst_motion_controller|y_tgt\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_motion_controller|y_que\(1),
	datab => \inst_motion_controller|y_tgt\(1),
	datac => \inst_motion_controller|x_tgt[3]~0_combout\,
	datad => \rst_n~input_o\,
	combout => \inst_motion_controller|y_tgt\(1));

\sw[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(0),
	o => \sw[0]~input_o\);

\inst_motion_controller|y_que[0]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_motion_controller|y_que\(0) = (\rst_n~input_o\ & ((\inst_motion_controller|y_que[0]~0_combout\ & (\sw[0]~input_o\)) # (!\inst_motion_controller|y_que[0]~0_combout\ & ((\inst_motion_controller|y_que\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw[0]~input_o\,
	datab => \inst_motion_controller|y_que\(0),
	datac => \inst_motion_controller|y_que[0]~0_combout\,
	datad => \rst_n~input_o\,
	combout => \inst_motion_controller|y_que\(0));

\inst_motion_controller|y_tgt[0]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_motion_controller|y_tgt\(0) = (\rst_n~input_o\ & ((\inst_motion_controller|x_tgt[3]~0_combout\ & (\inst_motion_controller|y_que\(0))) # (!\inst_motion_controller|x_tgt[3]~0_combout\ & ((\inst_motion_controller|y_tgt\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_motion_controller|y_que\(0),
	datab => \inst_motion_controller|y_tgt\(0),
	datac => \inst_motion_controller|x_tgt[3]~0_combout\,
	datad => \rst_n~input_o\,
	combout => \inst_motion_controller|y_tgt\(0));

\inst_compare_y|agtb_4bit~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_compare_y|agtb_4bit~2_combout\ = (\inst_motion_controller|y_tgt\(1) & (((\inst_motion_controller|y_tgt\(0) & !\inst_counter_y|ud_bin_counter\(0))) # (!\inst_counter_y|ud_bin_counter\(1)))) # (!\inst_motion_controller|y_tgt\(1) & 
-- (\inst_motion_controller|y_tgt\(0) & (!\inst_counter_y|ud_bin_counter\(0) & !\inst_counter_y|ud_bin_counter\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_motion_controller|y_tgt\(1),
	datab => \inst_motion_controller|y_tgt\(0),
	datac => \inst_counter_y|ud_bin_counter\(0),
	datad => \inst_counter_y|ud_bin_counter\(1),
	combout => \inst_compare_y|agtb_4bit~2_combout\);

\inst_compare_y|agtb_4bit~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_compare_y|agtb_4bit~3_combout\ = (\inst_compare_y|agtb_4bit~1_combout\) # ((\inst_compare_y|agtb_4bit~0_combout\ & \inst_compare_y|agtb_4bit~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_compare_y|agtb_4bit~1_combout\,
	datab => \inst_compare_y|agtb_4bit~0_combout\,
	datac => \inst_compare_y|agtb_4bit~2_combout\,
	combout => \inst_compare_y|agtb_4bit~3_combout\);

\inst_counter_y|process_0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_counter_y|process_0~0_combout\ = (((!\inst_counter_y|ud_bin_counter\(3)) # (!\inst_counter_y|ud_bin_counter\(2))) # (!\inst_counter_y|ud_bin_counter\(1))) # (!\inst_counter_y|ud_bin_counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter_y|ud_bin_counter\(0),
	datab => \inst_counter_y|ud_bin_counter\(1),
	datac => \inst_counter_y|ud_bin_counter\(2),
	datad => \inst_counter_y|ud_bin_counter\(3),
	combout => \inst_counter_y|process_0~0_combout\);

\inst_counter_y|process_0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_counter_y|process_0~1_combout\ = (\inst_motion_controller|enable_y_out~2_combout\ & (\inst_compare_y|agtb_4bit~3_combout\ & \inst_counter_y|process_0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_motion_controller|enable_y_out~2_combout\,
	datab => \inst_compare_y|agtb_4bit~3_combout\,
	datac => \inst_counter_y|process_0~0_combout\,
	combout => \inst_counter_y|process_0~1_combout\);

\inst_counter_y|ud_bin_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~input_o\,
	d => \inst_counter_y|ud_bin_counter[2]~10_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_counter_y|ud_bin_counter~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_counter_y|ud_bin_counter\(2));

\inst_compare_y|agtb_4bit~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_compare_y|agtb_4bit~0_combout\ = (\inst_counter_y|ud_bin_counter\(2) & (\inst_motion_controller|y_tgt\(2) & (\inst_counter_y|ud_bin_counter\(3) $ (!\inst_motion_controller|y_tgt\(3))))) # (!\inst_counter_y|ud_bin_counter\(2) & 
-- (!\inst_motion_controller|y_tgt\(2) & (\inst_counter_y|ud_bin_counter\(3) $ (!\inst_motion_controller|y_tgt\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter_y|ud_bin_counter\(2),
	datab => \inst_counter_y|ud_bin_counter\(3),
	datac => \inst_motion_controller|y_tgt\(3),
	datad => \inst_motion_controller|y_tgt\(2),
	combout => \inst_compare_y|agtb_4bit~0_combout\);

\inst_motion_controller|enable_y_out~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_motion_controller|enable_y_out~2_combout\ = (\inst_motion_controller|enable_y_out~0_combout\) # ((\inst_motion_controller|enable_y_out~1_combout\ & ((\inst_compare_y|aeqb_4bit~0_combout\) # (!\inst_compare_y|agtb_4bit~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_motion_controller|enable_y_out~0_combout\,
	datab => \inst_motion_controller|enable_y_out~1_combout\,
	datac => \inst_compare_y|aeqb_4bit~0_combout\,
	datad => \inst_compare_y|agtb_4bit~0_combout\,
	combout => \inst_motion_controller|enable_y_out~2_combout\);

\inst_counter_y|ud_bin_counter~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_counter_y|ud_bin_counter~3_combout\ = (\inst_counter_y|ud_bin_counter\(0)) # ((\inst_counter_y|ud_bin_counter\(1)) # ((\inst_counter_y|ud_bin_counter\(2)) # (\inst_counter_y|ud_bin_counter\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter_y|ud_bin_counter\(0),
	datab => \inst_counter_y|ud_bin_counter\(1),
	datac => \inst_counter_y|ud_bin_counter\(2),
	datad => \inst_counter_y|ud_bin_counter\(3),
	combout => \inst_counter_y|ud_bin_counter~3_combout\);

\inst_counter_y|ud_bin_counter~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_counter_y|ud_bin_counter~4_combout\ = (\inst_motion_controller|enable_y_out~2_combout\ & ((\inst_compare_y|agtb_4bit~3_combout\ & (\inst_counter_y|process_0~0_combout\)) # (!\inst_compare_y|agtb_4bit~3_combout\ & 
-- ((\inst_counter_y|ud_bin_counter~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_motion_controller|enable_y_out~2_combout\,
	datab => \inst_counter_y|process_0~0_combout\,
	datac => \inst_counter_y|ud_bin_counter~3_combout\,
	datad => \inst_compare_y|agtb_4bit~3_combout\,
	combout => \inst_counter_y|ud_bin_counter~4_combout\);

\inst_counter_y|ud_bin_counter[0]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_counter_y|ud_bin_counter[0]~5_combout\ = \inst_counter_y|ud_bin_counter\(0) $ (\inst_counter_y|ud_bin_counter~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_counter_y|ud_bin_counter\(0),
	datad => \inst_counter_y|ud_bin_counter~4_combout\,
	combout => \inst_counter_y|ud_bin_counter[0]~5_combout\);

\inst_counter_y|ud_bin_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~input_o\,
	d => \inst_counter_y|ud_bin_counter[0]~5_combout\,
	clrn => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_counter_y|ud_bin_counter\(0));

\inst_compare_y|aeqb_4bit~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_compare_y|aeqb_4bit~0_combout\ = (\inst_counter_y|ud_bin_counter\(0) & ((\inst_counter_y|ud_bin_counter\(1) $ (\inst_motion_controller|y_tgt\(1))) # (!\inst_motion_controller|y_tgt\(0)))) # (!\inst_counter_y|ud_bin_counter\(0) & 
-- ((\inst_motion_controller|y_tgt\(0)) # (\inst_counter_y|ud_bin_counter\(1) $ (\inst_motion_controller|y_tgt\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110111111110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter_y|ud_bin_counter\(0),
	datab => \inst_motion_controller|y_tgt\(0),
	datac => \inst_counter_y|ud_bin_counter\(1),
	datad => \inst_motion_controller|y_tgt\(1),
	combout => \inst_compare_y|aeqb_4bit~0_combout\);

\inst_compare_y|aeqb_4bit\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_compare_y|aeqb_4bit~combout\ = (\inst_compare_y|aeqb_4bit~0_combout\) # (!\inst_compare_y|agtb_4bit~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_compare_y|aeqb_4bit~0_combout\,
	datad => \inst_compare_y|agtb_4bit~0_combout\,
	combout => \inst_compare_y|aeqb_4bit~combout\);

\inst_motion_controller|x_tgt[3]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_motion_controller|x_tgt[3]~0_combout\ = (\inst_motion_controller|current_state~q\ & (\inst_compare_x|agtb_4bit~0_combout\ & (!\inst_compare_y|aeqb_4bit~combout\ & !\inst_compare_x|aeqb_4bit~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_motion_controller|current_state~q\,
	datab => \inst_compare_x|agtb_4bit~0_combout\,
	datac => \inst_compare_y|aeqb_4bit~combout\,
	datad => \inst_compare_x|aeqb_4bit~0_combout\,
	combout => \inst_motion_controller|x_tgt[3]~0_combout\);

\inst_motion_controller|y_que[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_motion_controller|y_que[0]~0_combout\ = (\inst_motion_controller|r1~q\ & (!\inst_motion_controller|r0~q\ & !\inst_motion_controller|x_tgt[3]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_motion_controller|r1~q\,
	datac => \inst_motion_controller|r0~q\,
	datad => \inst_motion_controller|x_tgt[3]~0_combout\,
	combout => \inst_motion_controller|y_que[0]~0_combout\);

\inst_motion_controller|x_que[3]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_motion_controller|x_que\(3) = (\rst_n~input_o\ & ((\inst_motion_controller|y_que[0]~0_combout\ & (\sw[7]~input_o\)) # (!\inst_motion_controller|y_que[0]~0_combout\ & ((\inst_motion_controller|x_que\(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw[7]~input_o\,
	datab => \inst_motion_controller|x_que\(3),
	datac => \inst_motion_controller|y_que[0]~0_combout\,
	datad => \rst_n~input_o\,
	combout => \inst_motion_controller|x_que\(3));

\inst_motion_controller|x_tgt[3]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_motion_controller|x_tgt\(3) = (\rst_n~input_o\ & ((\inst_motion_controller|x_tgt[3]~0_combout\ & (\inst_motion_controller|x_que\(3))) # (!\inst_motion_controller|x_tgt[3]~0_combout\ & ((\inst_motion_controller|x_tgt\(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_motion_controller|x_que\(3),
	datab => \inst_motion_controller|x_tgt\(3),
	datac => \inst_motion_controller|x_tgt[3]~0_combout\,
	datad => \rst_n~input_o\,
	combout => \inst_motion_controller|x_tgt\(3));

\sw[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(6),
	o => \sw[6]~input_o\);

\inst_motion_controller|x_que[2]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_motion_controller|x_que\(2) = (\rst_n~input_o\ & ((\inst_motion_controller|y_que[0]~0_combout\ & (\sw[6]~input_o\)) # (!\inst_motion_controller|y_que[0]~0_combout\ & ((\inst_motion_controller|x_que\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw[6]~input_o\,
	datab => \inst_motion_controller|x_que\(2),
	datac => \inst_motion_controller|y_que[0]~0_combout\,
	datad => \rst_n~input_o\,
	combout => \inst_motion_controller|x_que\(2));

\inst_motion_controller|x_tgt[2]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_motion_controller|x_tgt\(2) = (\rst_n~input_o\ & ((\inst_motion_controller|x_tgt[3]~0_combout\ & (\inst_motion_controller|x_que\(2))) # (!\inst_motion_controller|x_tgt[3]~0_combout\ & ((\inst_motion_controller|x_tgt\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_motion_controller|x_que\(2),
	datab => \inst_motion_controller|x_tgt\(2),
	datac => \inst_motion_controller|x_tgt[3]~0_combout\,
	datad => \rst_n~input_o\,
	combout => \inst_motion_controller|x_tgt\(2));

\inst_counter_x|ud_bin_counter[1]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_counter_x|ud_bin_counter[1]~7_cout\ = CARRY(\inst_counter_x|ud_bin_counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter_x|ud_bin_counter\(0),
	datad => VCC,
	cout => \inst_counter_x|ud_bin_counter[1]~7_cout\);

\inst_counter_x|ud_bin_counter[1]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_counter_x|ud_bin_counter[1]~8_combout\ = (\inst_counter_x|ud_bin_counter\(1) & ((\inst_counter_x|process_0~1_combout\ & (!\inst_counter_x|ud_bin_counter[1]~7_cout\)) # (!\inst_counter_x|process_0~1_combout\ & 
-- (\inst_counter_x|ud_bin_counter[1]~7_cout\ & VCC)))) # (!\inst_counter_x|ud_bin_counter\(1) & ((\inst_counter_x|process_0~1_combout\ & ((\inst_counter_x|ud_bin_counter[1]~7_cout\) # (GND))) # (!\inst_counter_x|process_0~1_combout\ & 
-- (!\inst_counter_x|ud_bin_counter[1]~7_cout\))))
-- \inst_counter_x|ud_bin_counter[1]~9\ = CARRY((\inst_counter_x|ud_bin_counter\(1) & (\inst_counter_x|process_0~1_combout\ & !\inst_counter_x|ud_bin_counter[1]~7_cout\)) # (!\inst_counter_x|ud_bin_counter\(1) & ((\inst_counter_x|process_0~1_combout\) # 
-- (!\inst_counter_x|ud_bin_counter[1]~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter_x|ud_bin_counter\(1),
	datab => \inst_counter_x|process_0~1_combout\,
	datad => VCC,
	cin => \inst_counter_x|ud_bin_counter[1]~7_cout\,
	combout => \inst_counter_x|ud_bin_counter[1]~8_combout\,
	cout => \inst_counter_x|ud_bin_counter[1]~9\);

\inst_counter_x|ud_bin_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~input_o\,
	d => \inst_counter_x|ud_bin_counter[1]~8_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_counter_x|ud_bin_counter~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_counter_x|ud_bin_counter\(1));

\inst_counter_x|ud_bin_counter[2]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_counter_x|ud_bin_counter[2]~10_combout\ = ((\inst_counter_x|ud_bin_counter\(2) $ (\inst_counter_x|process_0~1_combout\ $ (\inst_counter_x|ud_bin_counter[1]~9\)))) # (GND)
-- \inst_counter_x|ud_bin_counter[2]~11\ = CARRY((\inst_counter_x|ud_bin_counter\(2) & ((!\inst_counter_x|ud_bin_counter[1]~9\) # (!\inst_counter_x|process_0~1_combout\))) # (!\inst_counter_x|ud_bin_counter\(2) & (!\inst_counter_x|process_0~1_combout\ & 
-- !\inst_counter_x|ud_bin_counter[1]~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter_x|ud_bin_counter\(2),
	datab => \inst_counter_x|process_0~1_combout\,
	datad => VCC,
	cin => \inst_counter_x|ud_bin_counter[1]~9\,
	combout => \inst_counter_x|ud_bin_counter[2]~10_combout\,
	cout => \inst_counter_x|ud_bin_counter[2]~11\);

\inst_counter_x|ud_bin_counter[3]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_counter_x|ud_bin_counter[3]~12_combout\ = \inst_counter_x|ud_bin_counter\(3) $ (\inst_counter_x|process_0~1_combout\ $ (!\inst_counter_x|ud_bin_counter[2]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101101001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter_x|ud_bin_counter\(3),
	datab => \inst_counter_x|process_0~1_combout\,
	cin => \inst_counter_x|ud_bin_counter[2]~11\,
	combout => \inst_counter_x|ud_bin_counter[3]~12_combout\);

\inst_counter_x|ud_bin_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~input_o\,
	d => \inst_counter_x|ud_bin_counter[3]~12_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_counter_x|ud_bin_counter~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_counter_x|ud_bin_counter\(3));

\inst_compare_x|agtb_4bit~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_compare_x|agtb_4bit~1_combout\ = (\inst_motion_controller|x_tgt\(3) & (((\inst_motion_controller|x_tgt\(2) & !\inst_counter_x|ud_bin_counter\(2))) # (!\inst_counter_x|ud_bin_counter\(3)))) # (!\inst_motion_controller|x_tgt\(3) & 
-- (\inst_motion_controller|x_tgt\(2) & (!\inst_counter_x|ud_bin_counter\(2) & !\inst_counter_x|ud_bin_counter\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_motion_controller|x_tgt\(3),
	datab => \inst_motion_controller|x_tgt\(2),
	datac => \inst_counter_x|ud_bin_counter\(2),
	datad => \inst_counter_x|ud_bin_counter\(3),
	combout => \inst_compare_x|agtb_4bit~1_combout\);

\sw[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(5),
	o => \sw[5]~input_o\);

\inst_motion_controller|x_que[1]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_motion_controller|x_que\(1) = (\rst_n~input_o\ & ((\inst_motion_controller|y_que[0]~0_combout\ & (\sw[5]~input_o\)) # (!\inst_motion_controller|y_que[0]~0_combout\ & ((\inst_motion_controller|x_que\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw[5]~input_o\,
	datab => \inst_motion_controller|x_que\(1),
	datac => \inst_motion_controller|y_que[0]~0_combout\,
	datad => \rst_n~input_o\,
	combout => \inst_motion_controller|x_que\(1));

\inst_motion_controller|x_tgt[1]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_motion_controller|x_tgt\(1) = (\rst_n~input_o\ & ((\inst_motion_controller|x_tgt[3]~0_combout\ & (\inst_motion_controller|x_que\(1))) # (!\inst_motion_controller|x_tgt[3]~0_combout\ & ((\inst_motion_controller|x_tgt\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_motion_controller|x_que\(1),
	datab => \inst_motion_controller|x_tgt\(1),
	datac => \inst_motion_controller|x_tgt[3]~0_combout\,
	datad => \rst_n~input_o\,
	combout => \inst_motion_controller|x_tgt\(1));

\sw[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(4),
	o => \sw[4]~input_o\);

\inst_motion_controller|x_que[0]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_motion_controller|x_que\(0) = (\rst_n~input_o\ & ((\inst_motion_controller|y_que[0]~0_combout\ & (\sw[4]~input_o\)) # (!\inst_motion_controller|y_que[0]~0_combout\ & ((\inst_motion_controller|x_que\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw[4]~input_o\,
	datab => \inst_motion_controller|x_que\(0),
	datac => \inst_motion_controller|y_que[0]~0_combout\,
	datad => \rst_n~input_o\,
	combout => \inst_motion_controller|x_que\(0));

\inst_motion_controller|x_tgt[0]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_motion_controller|x_tgt\(0) = (\rst_n~input_o\ & ((\inst_motion_controller|x_tgt[3]~0_combout\ & (\inst_motion_controller|x_que\(0))) # (!\inst_motion_controller|x_tgt[3]~0_combout\ & ((\inst_motion_controller|x_tgt\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_motion_controller|x_que\(0),
	datab => \inst_motion_controller|x_tgt\(0),
	datac => \inst_motion_controller|x_tgt[3]~0_combout\,
	datad => \rst_n~input_o\,
	combout => \inst_motion_controller|x_tgt\(0));

\inst_compare_x|agtb_4bit~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_compare_x|agtb_4bit~2_combout\ = (\inst_motion_controller|x_tgt\(1) & (((\inst_motion_controller|x_tgt\(0) & !\inst_counter_x|ud_bin_counter\(0))) # (!\inst_counter_x|ud_bin_counter\(1)))) # (!\inst_motion_controller|x_tgt\(1) & 
-- (\inst_motion_controller|x_tgt\(0) & (!\inst_counter_x|ud_bin_counter\(0) & !\inst_counter_x|ud_bin_counter\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_motion_controller|x_tgt\(1),
	datab => \inst_motion_controller|x_tgt\(0),
	datac => \inst_counter_x|ud_bin_counter\(0),
	datad => \inst_counter_x|ud_bin_counter\(1),
	combout => \inst_compare_x|agtb_4bit~2_combout\);

\inst_compare_x|agtb_4bit~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_compare_x|agtb_4bit~3_combout\ = (\inst_compare_x|agtb_4bit~1_combout\) # ((\inst_compare_x|agtb_4bit~0_combout\ & \inst_compare_x|agtb_4bit~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_compare_x|agtb_4bit~1_combout\,
	datab => \inst_compare_x|agtb_4bit~0_combout\,
	datac => \inst_compare_x|agtb_4bit~2_combout\,
	combout => \inst_compare_x|agtb_4bit~3_combout\);

\inst_counter_x|process_0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_counter_x|process_0~0_combout\ = (((!\inst_counter_x|ud_bin_counter\(3)) # (!\inst_counter_x|ud_bin_counter\(2))) # (!\inst_counter_x|ud_bin_counter\(1))) # (!\inst_counter_x|ud_bin_counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter_x|ud_bin_counter\(0),
	datab => \inst_counter_x|ud_bin_counter\(1),
	datac => \inst_counter_x|ud_bin_counter\(2),
	datad => \inst_counter_x|ud_bin_counter\(3),
	combout => \inst_counter_x|process_0~0_combout\);

\inst_counter_x|process_0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_counter_x|process_0~1_combout\ = (\inst_motion_controller|enable_x_out~0_combout\ & (\inst_compare_x|agtb_4bit~3_combout\ & \inst_counter_x|process_0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_motion_controller|enable_x_out~0_combout\,
	datab => \inst_compare_x|agtb_4bit~3_combout\,
	datac => \inst_counter_x|process_0~0_combout\,
	combout => \inst_counter_x|process_0~1_combout\);

\inst_counter_x|ud_bin_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~input_o\,
	d => \inst_counter_x|ud_bin_counter[2]~10_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_counter_x|ud_bin_counter~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_counter_x|ud_bin_counter\(2));

\inst_compare_x|agtb_4bit~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_compare_x|agtb_4bit~0_combout\ = (\inst_counter_x|ud_bin_counter\(2) & (\inst_motion_controller|x_tgt\(2) & (\inst_counter_x|ud_bin_counter\(3) $ (!\inst_motion_controller|x_tgt\(3))))) # (!\inst_counter_x|ud_bin_counter\(2) & 
-- (!\inst_motion_controller|x_tgt\(2) & (\inst_counter_x|ud_bin_counter\(3) $ (!\inst_motion_controller|x_tgt\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter_x|ud_bin_counter\(2),
	datab => \inst_counter_x|ud_bin_counter\(3),
	datac => \inst_motion_controller|x_tgt\(3),
	datad => \inst_motion_controller|x_tgt\(2),
	combout => \inst_compare_x|agtb_4bit~0_combout\);

\inst_motion_controller|enable_x_out~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_motion_controller|enable_x_out~0_combout\ = (\inst_motion_controller|enable_y_out~0_combout\) # ((\inst_motion_controller|enable_y_out~1_combout\ & ((\inst_compare_x|aeqb_4bit~0_combout\) # (!\inst_compare_x|agtb_4bit~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_motion_controller|enable_y_out~0_combout\,
	datab => \inst_motion_controller|enable_y_out~1_combout\,
	datac => \inst_compare_x|aeqb_4bit~0_combout\,
	datad => \inst_compare_x|agtb_4bit~0_combout\,
	combout => \inst_motion_controller|enable_x_out~0_combout\);

\inst_counter_x|ud_bin_counter~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_counter_x|ud_bin_counter~3_combout\ = (\inst_counter_x|ud_bin_counter\(0)) # ((\inst_counter_x|ud_bin_counter\(1)) # ((\inst_counter_x|ud_bin_counter\(2)) # (\inst_counter_x|ud_bin_counter\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter_x|ud_bin_counter\(0),
	datab => \inst_counter_x|ud_bin_counter\(1),
	datac => \inst_counter_x|ud_bin_counter\(2),
	datad => \inst_counter_x|ud_bin_counter\(3),
	combout => \inst_counter_x|ud_bin_counter~3_combout\);

\inst_counter_x|ud_bin_counter~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_counter_x|ud_bin_counter~4_combout\ = (\inst_motion_controller|enable_x_out~0_combout\ & ((\inst_compare_x|agtb_4bit~3_combout\ & (\inst_counter_x|process_0~0_combout\)) # (!\inst_compare_x|agtb_4bit~3_combout\ & 
-- ((\inst_counter_x|ud_bin_counter~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_motion_controller|enable_x_out~0_combout\,
	datab => \inst_counter_x|process_0~0_combout\,
	datac => \inst_counter_x|ud_bin_counter~3_combout\,
	datad => \inst_compare_x|agtb_4bit~3_combout\,
	combout => \inst_counter_x|ud_bin_counter~4_combout\);

\inst_counter_x|ud_bin_counter[0]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_counter_x|ud_bin_counter[0]~5_combout\ = \inst_counter_x|ud_bin_counter\(0) $ (\inst_counter_x|ud_bin_counter~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_counter_x|ud_bin_counter\(0),
	datad => \inst_counter_x|ud_bin_counter~4_combout\,
	combout => \inst_counter_x|ud_bin_counter[0]~5_combout\);

\inst_counter_x|ud_bin_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~input_o\,
	d => \inst_counter_x|ud_bin_counter[0]~5_combout\,
	clrn => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_counter_x|ud_bin_counter\(0));

\inst_compare_x|aeqb_4bit~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_compare_x|aeqb_4bit~0_combout\ = (\inst_counter_x|ud_bin_counter\(0) & ((\inst_counter_x|ud_bin_counter\(1) $ (\inst_motion_controller|x_tgt\(1))) # (!\inst_motion_controller|x_tgt\(0)))) # (!\inst_counter_x|ud_bin_counter\(0) & 
-- ((\inst_motion_controller|x_tgt\(0)) # (\inst_counter_x|ud_bin_counter\(1) $ (\inst_motion_controller|x_tgt\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110111111110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_counter_x|ud_bin_counter\(0),
	datab => \inst_motion_controller|x_tgt\(0),
	datac => \inst_counter_x|ud_bin_counter\(1),
	datad => \inst_motion_controller|x_tgt\(1),
	combout => \inst_compare_x|aeqb_4bit~0_combout\);

\inst_motion_controller|decoder_section~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_motion_controller|decoder_section~0_combout\ = (\inst_motion_controller|sys_fault~combout\) # ((!\inst_extension_controller|ext_stat~combout\ & ((\inst_compare_x|aeqb_4bit~0_combout\) # (!\inst_compare_x|agtb_4bit~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_motion_controller|sys_fault~combout\,
	datab => \inst_compare_x|aeqb_4bit~0_combout\,
	datac => \inst_compare_x|agtb_4bit~0_combout\,
	datad => \inst_extension_controller|ext_stat~combout\,
	combout => \inst_motion_controller|decoder_section~0_combout\);

\inst_motion_controller|decoder_section~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_motion_controller|decoder_section~1_combout\ = (\inst_motion_controller|enable_y_out~0_combout\) # ((\inst_motion_controller|decoder_section~0_combout\) # ((\inst_compare_y|aeqb_4bit~combout\ & !\inst_extension_controller|ext_stat~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_motion_controller|enable_y_out~0_combout\,
	datab => \inst_motion_controller|decoder_section~0_combout\,
	datac => \inst_compare_y|aeqb_4bit~combout\,
	datad => \inst_extension_controller|ext_stat~combout\,
	combout => \inst_motion_controller|decoder_section~1_combout\);

\inst_motion_controller|back_to_idle~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_motion_controller|back_to_idle~0_combout\ = (\inst_motion_controller|current_state~q\ & \rst_n~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_motion_controller|current_state~q\,
	datab => \rst_n~input_o\,
	combout => \inst_motion_controller|back_to_idle~0_combout\);

\inst_motion_controller|back_to_idle\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_motion_controller|back_to_idle~combout\ = (\inst_motion_controller|back_to_idle~0_combout\ & (!\inst_motion_controller|decoder_section~1_combout\)) # (!\inst_motion_controller|back_to_idle~0_combout\ & 
-- ((\inst_motion_controller|back_to_idle~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_motion_controller|decoder_section~1_combout\,
	datac => \inst_motion_controller|back_to_idle~combout\,
	datad => \inst_motion_controller|back_to_idle~0_combout\,
	combout => \inst_motion_controller|back_to_idle~combout\);

\inst_motion_controller|next_state~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_motion_controller|next_state~0_combout\ = (\inst_motion_controller|current_state~q\ & (((!\inst_motion_controller|back_to_idle~combout\)))) # (!\inst_motion_controller|current_state~q\ & (\inst_motion_controller|r1~q\ & 
-- (!\inst_motion_controller|r0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_motion_controller|r1~q\,
	datab => \inst_motion_controller|current_state~q\,
	datac => \inst_motion_controller|r0~q\,
	datad => \inst_motion_controller|back_to_idle~combout\,
	combout => \inst_motion_controller|next_state~0_combout\);

\inst_motion_controller|current_state\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~input_o\,
	d => \inst_motion_controller|next_state~0_combout\,
	clrn => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_motion_controller|current_state~q\);

\inst_motion_controller|en_ext\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_motion_controller|en_ext~combout\ = (\rst_n~input_o\ & (!\inst_motion_controller|current_state~q\)) # (!\rst_n~input_o\ & ((\inst_motion_controller|en_ext~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_motion_controller|current_state~q\,
	datac => \inst_motion_controller|en_ext~combout\,
	datad => \rst_n~input_o\,
	combout => \inst_motion_controller|en_ext~combout\);

\pb[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pb(1),
	o => \pb[1]~input_o\);

\inst_extension_controller|r0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~input_o\,
	d => \pb[1]~input_o\,
	clrn => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_extension_controller|r0~q\);

\inst_extension_controller|r1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~input_o\,
	d => \inst_extension_controller|r0~q\,
	clrn => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_extension_controller|r1~q\);

\inst_extension_controller|grapple~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_extension_controller|grapple~0_combout\ = (\inst_extend_shifter|sreg\(0) & (\inst_extend_shifter|sreg\(1) & (\inst_extend_shifter|sreg\(2) & \inst_extend_shifter|sreg\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_extend_shifter|sreg\(0),
	datab => \inst_extend_shifter|sreg\(1),
	datac => \inst_extend_shifter|sreg\(2),
	datad => \inst_extend_shifter|sreg\(3),
	combout => \inst_extension_controller|grapple~0_combout\);

\inst_extension_controller|ext_shift~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_extension_controller|ext_shift~2_combout\ = (\inst_extension_controller|r1~q\ & (!\inst_extension_controller|r0~q\ & ((\inst_extension_controller|ext_shift~0_combout\) # (\inst_extension_controller|grapple~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_extension_controller|r1~q\,
	datab => \inst_extension_controller|ext_shift~0_combout\,
	datac => \inst_extension_controller|grapple~0_combout\,
	datad => \inst_extension_controller|r0~q\,
	combout => \inst_extension_controller|ext_shift~2_combout\);

\inst_extension_controller|ext_shift~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_extension_controller|ext_shift~3_combout\ = (\inst_motion_controller|en_ext~combout\ & ((\inst_extension_controller|ext_shift~2_combout\) # (!\rst_n~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_motion_controller|en_ext~combout\,
	datab => \inst_extension_controller|ext_shift~2_combout\,
	datad => \rst_n~input_o\,
	combout => \inst_extension_controller|ext_shift~3_combout\);

\inst_extension_controller|ext_shift\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_extension_controller|ext_shift~combout\ = (\inst_extension_controller|ext_shift~3_combout\ & (\inst_extension_controller|ext_shift~1_combout\)) # (!\inst_extension_controller|ext_shift~3_combout\ & ((\inst_extension_controller|ext_shift~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_extension_controller|ext_shift~1_combout\,
	datac => \inst_extension_controller|ext_shift~combout\,
	datad => \inst_extension_controller|ext_shift~3_combout\,
	combout => \inst_extension_controller|ext_shift~combout\);

\inst_extend_shifter|sreg~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_extend_shifter|sreg~3_combout\ = (\inst_extend_shifter|sreg\(2)) # (\inst_extension_controller|ext_shift~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_extend_shifter|sreg\(2),
	datab => \inst_extension_controller|ext_shift~combout\,
	combout => \inst_extend_shifter|sreg~3_combout\);

\inst_extension_controller|ext_en~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_extension_controller|ext_en~0_combout\ = (!\inst_motion_controller|en_ext~combout\) # (!\rst_n~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst_n~input_o\,
	datad => \inst_motion_controller|en_ext~combout\,
	combout => \inst_extension_controller|ext_en~0_combout\);

\inst_extension_controller|ext_en\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_extension_controller|ext_en~combout\ = (!\inst_extension_controller|ext_en~0_combout\ & ((\inst_extension_controller|ext_en~combout\) # (\inst_extension_controller|ext_shift~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_extension_controller|ext_en~combout\,
	datac => \inst_extension_controller|ext_shift~2_combout\,
	datad => \inst_extension_controller|ext_en~0_combout\,
	combout => \inst_extension_controller|ext_en~combout\);

\inst_extend_shifter|sreg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~input_o\,
	d => \inst_extend_shifter|sreg~3_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_extension_controller|ext_en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_extend_shifter|sreg\(3));

\inst_extend_shifter|sreg~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_extend_shifter|sreg~2_combout\ = (\inst_extension_controller|ext_shift~combout\ & (\inst_extend_shifter|sreg\(3))) # (!\inst_extension_controller|ext_shift~combout\ & ((\inst_extend_shifter|sreg\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_extend_shifter|sreg\(3),
	datab => \inst_extend_shifter|sreg\(1),
	datad => \inst_extension_controller|ext_shift~combout\,
	combout => \inst_extend_shifter|sreg~2_combout\);

\inst_extend_shifter|sreg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~input_o\,
	d => \inst_extend_shifter|sreg~2_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_extension_controller|ext_en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_extend_shifter|sreg\(2));

\inst_extend_shifter|sreg~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_extend_shifter|sreg~1_combout\ = (\inst_extension_controller|ext_shift~combout\ & (\inst_extend_shifter|sreg\(2))) # (!\inst_extension_controller|ext_shift~combout\ & ((\inst_extend_shifter|sreg\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_extend_shifter|sreg\(2),
	datab => \inst_extend_shifter|sreg\(0),
	datad => \inst_extension_controller|ext_shift~combout\,
	combout => \inst_extend_shifter|sreg~1_combout\);

\inst_extend_shifter|sreg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~input_o\,
	d => \inst_extend_shifter|sreg~1_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_extension_controller|ext_en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_extend_shifter|sreg\(1));

\inst_extend_shifter|sreg~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_extend_shifter|sreg~0_combout\ = (\inst_extend_shifter|sreg\(1) & \inst_extension_controller|ext_shift~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_extend_shifter|sreg\(1),
	datab => \inst_extension_controller|ext_shift~combout\,
	combout => \inst_extend_shifter|sreg~0_combout\);

\inst_extend_shifter|sreg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~input_o\,
	d => \inst_extend_shifter|sreg~0_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_extension_controller|ext_en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_extend_shifter|sreg\(0));

\inst_extension_controller|ext_shift~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_extension_controller|ext_shift~0_combout\ = (!\inst_extend_shifter|sreg\(0) & (!\inst_extend_shifter|sreg\(1) & (!\inst_extend_shifter|sreg\(2) & !\inst_extend_shifter|sreg\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_extend_shifter|sreg\(0),
	datab => \inst_extend_shifter|sreg\(1),
	datac => \inst_extend_shifter|sreg\(2),
	datad => \inst_extend_shifter|sreg\(3),
	combout => \inst_extension_controller|ext_shift~0_combout\);

\inst_extension_controller|ext_stat~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_extension_controller|ext_stat~0_combout\ = (\inst_extension_controller|ext_shift~0_combout\) # (!\rst_n~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_extension_controller|ext_shift~0_combout\,
	datad => \rst_n~input_o\,
	combout => \inst_extension_controller|ext_stat~0_combout\);

\inst_extension_controller|ext_stat\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_extension_controller|ext_stat~combout\ = (\inst_motion_controller|en_ext~combout\ & (!\inst_extension_controller|ext_stat~0_combout\)) # (!\inst_motion_controller|en_ext~combout\ & ((\inst_extension_controller|ext_stat~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_extension_controller|ext_stat~0_combout\,
	datac => \inst_extension_controller|ext_stat~combout\,
	datad => \inst_motion_controller|en_ext~combout\,
	combout => \inst_extension_controller|ext_stat~combout\);

\inst_motion_controller|sys_fault\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_motion_controller|sys_fault~combout\ = (\rst_n~input_o\ & ((\inst_motion_controller|current_state~q\ & (\inst_extension_controller|ext_stat~combout\)) # (!\inst_motion_controller|current_state~q\ & ((\inst_motion_controller|sys_fault~combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_extension_controller|ext_stat~combout\,
	datab => \inst_motion_controller|sys_fault~combout\,
	datac => \inst_motion_controller|current_state~q\,
	datad => \rst_n~input_o\,
	combout => \inst_motion_controller|sys_fault~combout\);

\pb[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pb(0),
	o => \pb[0]~input_o\);

\inst_grapple_controller|r0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~input_o\,
	d => \pb[0]~input_o\,
	clrn => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_grapple_controller|r0~q\);

\inst_extension_controller|grapple~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_extension_controller|grapple~1_combout\ = (\rst_n~input_o\ & \inst_extension_controller|grapple~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst_n~input_o\,
	datab => \inst_extension_controller|grapple~0_combout\,
	combout => \inst_extension_controller|grapple~1_combout\);

\inst_extension_controller|grapple\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_extension_controller|grapple~combout\ = (\inst_motion_controller|en_ext~combout\ & (\inst_extension_controller|grapple~1_combout\)) # (!\inst_motion_controller|en_ext~combout\ & ((\inst_extension_controller|grapple~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_extension_controller|grapple~1_combout\,
	datac => \inst_extension_controller|grapple~combout\,
	datad => \inst_motion_controller|en_ext~combout\,
	combout => \inst_extension_controller|grapple~combout\);

\inst_grapple_controller|r1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~input_o\,
	d => \inst_grapple_controller|r0~q\,
	clrn => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_grapple_controller|r1~q\);

\inst_grapple_controller|grp_stat~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst_grapple_controller|grp_stat~0_combout\ = \inst_grapple_controller|grp_stat~q\ $ (((!\inst_grapple_controller|r0~q\ & (\inst_extension_controller|grapple~combout\ & \inst_grapple_controller|r1~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_grapple_controller|grp_stat~q\,
	datab => \inst_grapple_controller|r0~q\,
	datac => \inst_extension_controller|grapple~combout\,
	datad => \inst_grapple_controller|r1~q\,
	combout => \inst_grapple_controller|grp_stat~0_combout\);

\inst_grapple_controller|grp_stat\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~input_o\,
	d => \inst_grapple_controller|grp_stat~0_combout\,
	clrn => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_grapple_controller|grp_stat~q\);

\pb[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pb(3),
	o => \pb[3]~input_o\);

ww_leds(0) <= \leds[0]~output_o\;

ww_leds(1) <= \leds[1]~output_o\;

ww_leds(2) <= \leds[2]~output_o\;

ww_leds(3) <= \leds[3]~output_o\;

ww_leds(4) <= \leds[4]~output_o\;

ww_leds(5) <= \leds[5]~output_o\;

ww_leds(6) <= \leds[6]~output_o\;

ww_leds(7) <= \leds[7]~output_o\;

ww_leds(8) <= \leds[8]~output_o\;

ww_leds(9) <= \leds[9]~output_o\;

ww_leds(10) <= \leds[10]~output_o\;

ww_leds(11) <= \leds[11]~output_o\;

ww_leds(12) <= \leds[12]~output_o\;

ww_leds(13) <= \leds[13]~output_o\;

ww_leds(14) <= \leds[14]~output_o\;

ww_leds(15) <= \leds[15]~output_o\;
END structure;


