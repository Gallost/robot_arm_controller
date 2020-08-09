-- Group 3, Adrian Salvador & Harry He --
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY LogicalStep_Lab4_top IS
   PORT
	(
		Clk				: in	std_logic;
		rst_n				: in	std_logic;
		pb					: in	std_logic_vector(3 downto 0);
		sw   				: in  std_logic_vector(7 downto 0); 
		leds				: out std_logic_vector(15 downto 0)
	);
END LogicalStep_Lab4_top;

ARCHITECTURE Circuit OF LogicalStep_Lab4_top IS

-- GRAPPLE CONTROLLER
component grapple port
	(
		clock, reset				: in std_logic;
		enable, button_in			: in std_logic;
		
		status						: out std_logic
	);
end component;

-- EXTENSION CONTROLLER
component extend port
	(
		clock, reset, enable, button_in	: in std_logic;
		ext_pos									: in std_logic_vector(3 downto 0);
		
		status, grp_en							: out std_logic;
		ext_shift_out, ext_en_out			: out std_logic;
		position									: out std_logic_vector(3 downto 0)	
	);
end component;

-- MOTION CONTROLLER
component motion port
	(
		clock, reset					: in std_logic;
		button_in, status_ext		: in std_logic;
		x_eq, x_gt, x_lt				: in std_logic;
		y_eq, y_gt, y_lt				: in std_logic;
		x_input, y_input				: in std_logic_vector(3 downto 0);
		
		x_tgt_out, y_tgt_out 		: out std_logic_vector(3 downto 0);
		enable_ext						: out std_logic;
		enable_x_out, enable_y_out	: out std_logic;
		updown_x_out, updown_y_out : out std_logic;
		system_fault					: out std_logic
	);
end component;

-- HELPER COMPONENTS
component U_D_Bin_Counter4bit port
	(
		CLK				: in std_logic;
		RESET_n			: in std_logic;
		CLK_EN			: in std_logic;
		UP1_DOWN0		: in std_logic;
		COUNTER_BITS	: out std_logic_vector(3 downto 0)	
	);
end component;

component Compx4 port
	(
		inA_4bit, inB_4bit					: in std_logic_vector(3 downto 0);
		aeqb_4bit, agtb_4bit, altb_4bit	: out std_logic		
	);
end component;
	
component shift_reg_4bit port 
	(
		CLK				: in std_logic := '0';
		RESET_n			: in std_logic := '0';
		CLK_EN			: in std_logic := '0';
		LEFT0_RIGHT1	: in std_logic := '0';
		REG_BITS			: out std_logic_vector(3 downto 0)	
	);
end component;

-- SIGNALS
signal x_en, y_en, x_UD, y_UD 				: std_logic;	--	Enabling X/Y to increment or decrement					
signal x_teqc, x_tgtc, x_tltc					: std_logic;	-- Comparison results from target x vs current x
signal y_teqc, y_tgtc, y_tltc					: std_logic;	-- Comparison results from target y vs current y
signal arm_up_down, ext_shift_en				: std_logic;	--	Enabling extension shifting 
signal extension_enable, extender_status	: std_logic;	--	Signal to activate extender and extender status
signal grapple_enable, grapple_status		: std_logic;	-- Signal to activate grapple and grapple status
signal x_position, y_position 				: std_logic_vector(3 downto 0);	--	Current coordinates
signal x_target, y_target						: std_logic_vector(3 downto 0);	-- Target Coordinates
signal extension_position						: std_logic_vector(3 downto 0);	-- Extender Position


BEGIN

-- MOTION SEGMENT
inst_motion_controller: motion port map
	(
		clk, rst_n,
		pb(2), extender_status,				--	Catching system fault based on extender status
		x_teqc, x_tgtc, x_tltc,				-- Comparison results from target x vs current x
		y_teqc, y_tgtc, y_tltc,    		--	Comparison results from target y vs current y
		sw(7 downto 4), sw(3 downto 0),	-- X/Y target inputs
		
		x_target, y_target,	
		extension_enable,
		x_en, y_en,							-- Tells the counter whether to increment/decrement or NOT 
		x_UD, y_UD,
		leds(0)								-- System Fault Indicator
	);
	
inst_compare_x: Compx4 port map			-- Compx4 compares target position vs current position (x)
	(
		x_target, x_position,
		x_teqc, x_tgtc, x_tltc
	);

inst_compare_y: Compx4 port map			-- Compx4 compares target position vs current position (y)
	(
		y_target, y_position,
		y_teqc, y_tgtc, y_tltc
	);
	
inst_counter_x: U_D_Bin_Counter4bit port map
	(
		clk,								-- Incrementing and Decrementing current X
		rst_n,
		x_en,
		x_UD,
		x_position
	);

inst_counter_y: U_D_Bin_Counter4bit port map
	(
		clk,								-- Incrementing and Decrementing current Y
		rst_n,			
		y_en,
		y_UD,
		y_position
	);

leds(15 downto 12)	<= x_position;			-- Outputting current coordinates to their respective LEDs
leds(11 downto 8)		<= y_position;
	
	
-- EXTENDER SEGMENT
inst_extension_controller: extend port map
	(
		clk, rst_n, extension_enable, pb(1),		-- extension_enable is an output from motion controller
																	-- extender can only extend if extension_enable is TRUE
		
		extension_position,								-- extender_position is an output from shift register
																	-- to keep track of current position
		
		extender_status, grapple_enable,				-- shows if arm is extended and if grapple can be used
		arm_up_down, ext_shift_en,						-- Tells shift register whether to retract/extend arm
		leds(7 downto 4)									-- Outputting the extension position
	);
	
inst_extend_shifter: shift_reg_4bit port map
	(
		clk,								-- 4 Bit Shift Register that changes the extender position
		rst_n,
		ext_shift_en,					-- ext_shift_en and arm_up_down are outputs from the extend component
		arm_up_down,
		extension_position
	);
	
leds(1)	<= extender_status;


--	GRAPPLE SEGMENT
inst_grapple_controller: grapple port map
	(
		clk, rst_n, 
		grapple_enable, pb(0),			-- grapple_enable is an output from the extender
		
		grapple_status
	);

leds(3)	<= grapple_status;		-- outputs grapple status

END Circuit;
