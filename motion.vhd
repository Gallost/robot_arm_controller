LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity motion is port
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
end entity;

architecture coordinates of motion is

type states is (idle, moving);
signal current_state, next_state, lmao		: states;

signal en_ext, sys_fault						: std_logic;	-- enabling extender arm / indicator for system fault
signal en_x, en_y									: std_logic;	-- enabling x or y increment
signal button, r0, r1							: std_logic;	-- edge detection
signal coordinate_queued						: std_logic;	-- indicates whether or not if there is a new coordinate of interest
signal back_to_idle								: std_logic;	-- signal that shows if we are back in idle
signal x_tgt, y_tgt, x_que, y_que			: std_logic_vector(3 downto 0);	-- target coordinates and queued coordinates


begin

-- DETECTING FALLING EDGE OF BUTTON_INPUT
button_detector: process (clock, reset) begin

	if (reset = '0') then
		r0			<= '0';
		r1			<= '0';
	elsif (rising_edge(clock)) then
		r0			<= button_in;
		r1			<= r0;
	end if;

end process;
button	<= NOT(r0) AND r1;

-- UPDATING MACHINE STATE
register_section: process (clock, reset) begin

	if (reset = '0') then
		current_state <= idle;
	elsif (rising_edge(clock)) then
		current_state <= next_state;
	end if;

end process;

-- CHANGING STATES CONDITIONS
transition_section: process
	(
		current_state, button, back_to_idle
	)
begin

	case current_state is

		when idle =>
			if (button = '1') then
				next_state	<= moving;
			else
				next_state	<= idle;
			end if;

		when moving =>
			if (back_to_idle = '1') then
				next_state	<= idle;
			else
				next_state	<= moving;
			end if;

		when others =>
			next_state	<= idle;

	end case;

end process;


decoder_section: process
	(
		reset, button, current_state, status_ext,
		x_eq, x_gt, x_lt, x_tgt, x_que, en_x,
		y_eq, y_gt, y_lt, y_tgt, y_que, en_y
	)
begin

if (reset = '0') then
	x_tgt					<= "0000";
	y_tgt 				<= "0000";
	x_que 				<= "0000";
	y_que 				<= "0000";
	en_x					<= '0';
	en_y					<= '0';
	sys_fault			<= '0';
	coordinate_queued	<= '0';

else

	case current_state is

		when idle =>
			en_ext	<= '1';

		-- REGISTERING INPUT TO QUEUE WHEN BUTTON IS PRESSED, AND ACTIVATING U/D
			if (button = '1') then
				x_que	<= x_input;
				y_que	<= y_input;
				en_x	<= '1';
				en_y	<= '1';
				coordinate_queued	<= '1';
			else
				x_que	<= x_que;
				y_que	<= y_que;
				en_x	<= '0';
				en_y	<= '0';
				coordinate_queued	<= '0';
			end if;

		when moving =>
			en_ext	<= '0';

		-- REGISTERING QUEUE TO TARGET IF CURRENT LOCATION EQUALS TARGET LOCATION
		-- WHEN BUTTON IS PRESSED, IF CURRENT != TARGET LOCATION (MOVING), INPUT REGISTERED TO QUEUE
			if ((x_eq = '1') AND (y_eq = '1')) then
				x_tgt	<= x_que;
				y_tgt	<= y_que;
				x_que	<= x_que;
				y_que	<= y_que;
				coordinate_queued	<= '0';
			elsif (button = '1') then
				x_tgt	<= x_tgt;
				y_tgt	<= y_tgt;
				x_que	<= x_input;
				y_que	<= y_input;
				coordinate_queued	<= '1';
			end if;

		-- GOING BACK TO IDLE
			if ((en_x = '0') AND (en_y = '0') AND (sys_fault = '0')) then
				back_to_idle	<= '1';
			else
				back_to_idle	<= '0';
			end if;

		-- CATCHING SYSTEM FAULT
			if (status_ext = '1') then
				sys_fault	<= '1';
				en_x			<= '0';
				en_y			<= '0';
			elsif (status_ext = '0') then
				sys_fault	<= '0';
		-- STOPPING X/Y WHEN THEY REACH THE TARGET
				if (x_eq = '1') then
					en_x	<= '0';
				else
					en_x	<= '1';
				end if;

				if (y_eq = '1') then
					en_y	<= '0';
				else
					en_y	<= '1';
				end if;

			end if;

	end case;

end if;

end process;

x_tgt_out		<= x_tgt;			-- Outputting
y_tgt_out		<= y_tgt;
enable_ext		<= en_ext;
enable_x_out	<= en_x;
enable_y_out	<= en_y;
updown_x_out	<= x_gt;
updown_y_out	<= y_gt;
system_fault	<= sys_fault;

end;
