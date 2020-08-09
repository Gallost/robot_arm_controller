-- Group 3, Adrian Salvador & Harry He --

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAC is port
	(
		x_in, y_in				: in std_logic_vector(3 downto 0);
		clk, rst,
		motion_button,
		extend_button,
		grapple_button			: in std_logic;
		
		x_out, y_out,
		ext_pos_out				: out std_logic_vector(3 downto 0);
		grp_stat_out,
		ext_stat_out,
		sys_fault_out			: out std_logic
	);
end RAC;

architecture rac of RAC is

-- DECLARING SIGNALS
type state is (motion_state, extend_state, grapple_state);
signal current_state, next_state			: state;
signal x_tg, y_tg, x_cur, y_cur,
		 ext_pos, desired_ext_pos			: std_logic_vector(3 downto 0) := "0000";
signal xgt, xeq, xlt, xcount,
		 ygt, yeq, ylt, ycount,
		 grp_stat, ext_shift					: std_logic;
signal x_en, y_en,
		 ext_en, ext_stat,
		 sys_fault								: std_logic := '0';
signal motion, extend, grapple			: std_logic;




-- DECLARING COMPONENTS
component Compx4 port
	(
		inA_4bit, inB_4bit					: in std_logic_vector(3 downto 0);
		aeqb_4bit, agtb_4bit, altb_4bit	: out std_logic
	);
end component;

component U_D_Bin_Counter4bit port
	(
		CLK				: in std_logic := '0';
		RESET_n			: in std_logic := '0';
		CLK_EN			: in std_logic := '0';
		UP1_DOWN0		: in std_logic := '0';
		COUNTER_BITS	: out std_logic_vector(3 downto 0)
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


begin

x_tg <= "0010";
y_tg <= "0010";

-- INSTANCE OF 4BIT SHIFT REGISTER TO KEEP TRACK OF THE EXTENSION STATUS
inst_extPosition: shift_reg_4bit port map
	(
		clk,
		rst,
		ext_en,
		ext_shift,
		ext_pos
	);

-- INSTANCE OF COMPX4 TO COMPARE TARGET COORDINATES VS CURRENT COORDINATES
inst_xCompare: Compx4 port map
	(
		x_cur, x_tg,
		xeq, xgt, xlt
	);

inst_yCompare: Compx4 port map
	(
		y_cur, y_tg,
		yeq, ygt, ylt
	);

-- INSTANCE OF 4BIT BINARY COUNTER TO INCREMENT/DECREMENT CURRENT COORDINATES
inst_xcurCounter: U_D_Bin_Counter4bit port map
	(
		clk,
		rst,
		x_en,
		xcount,
		x_cur
	);
	
inst_ycurCounter: U_D_Bin_Counter4bit port map
	(
		clk,
		rst,
		y_en,
		ycount,
		y_cur
	);
	
-- PROCESSING CLK/RESET SIGNAL (REGISTER)
process (clk, rst) begin
	
	if (rst = '0') then
		current_state <= motion_state;
		
	elsif (rising_edge(clk)) then
		current_state <= next_state;
		
	end if;
		
end process;


-- PROCESSING BUTTONS
--process (motion_button, clk) 
--variable motion	: std_logic;
--begin
--
--	if (falling_edge(motion_button)) then
--		motion := '1';
--	else
--		motion := '0';
--	end if;
--	
--end process;


process (extend_button, clk)
variable extend	: std_logic;
begin

	if (falling_edge(extend_button)) then
		extend := '1';
	else
		extend := '0';
	end if;
	
end process;


process (grapple_button, clk)
variable grapple	: std_logic;
begin

	if (falling_edge(grapple_button)) then
		grapple := '1';
	else
		grapple := '0';
	end if;
	
end process;


-- CHANGING STATE (TRANSITION LOGIC PROCESS)
process (motion, extend, grapple, current_state) begin

	case current_state is
		
		when motion_state =>
			if ((extend = '1') AND (ext_pos = "0000") AND (xeq = '1') AND (yeq = '1')) then
				next_state <= extend_state;
			else
				next_state <= motion_state;
			end if;
		
		when extend_state =>
			if (desired_ext_pos = ext_pos) then
				if (ext_pos = "0000") then
					next_state <= motion_state;
				elsif (ext_pos = "1111") then
					next_state <= grapple_state;
				end if;
			else
				next_state <= extend_state;
			end if;
		
		when grapple_state =>
			if ((grp_stat = '0') AND (extend = '1')) then
				next_state <= extend_state;
			else
				next_state <= grapple_state;
			end if;
		
		when others =>
			next_state <= motion_state;
			
	end case;

end process;


-- ACTIONS IN DIFFERENT STATES (DECODER SECTION PROCESS)
process (
				x_tg, y_tg, x_cur, y_cur, xgt, xeq, xlt, ygt, yeq, ylt,
				ext_pos, desired_ext_pos, grp_stat,
				motion, extend, grapple,
				current_state
			) 

variable ext_stat, ext_shift, ext_en, grp_stat, 
			sys_fault, x_en, y_en, xcount, ycount	: std_logic;
variable ext_pos, desired_ext_pos, x_tg, y_tg 	: std_logic_vector(3 downto 0);

begin

	case current_state is
	
		when motion_state =>
			-- REGISTERING TARGET COORDINATES WHEN NOT MOVING AND THE MOTION BUTTON IS PRESSED
--			if ((xeq = '1') AND (yeq = '1') AND (motion_button = '1')) then
--				x_tg := x_in;
--				y_tg := y_in;
--			end if;
			
			-- INCREMENTING/DECREMENTING THE COORDINATES
			if (xgt = '1') then
				x_en := '1';
				xcount := '0';
			elsif (xlt = '1') then
				x_en := '1';
				xcount := '1';
			elsif (xeq = '1') then
				x_en := '0';
				xcount := '0';
			end if;
			
			if (ygt = '1') then
				y_en := '1';
				ycount := '0';
			elsif (ylt = '1') then
				y_en := '1';
				ycount := '1';
			elsif (yeq = '1') then
				y_en := '0';
				ycount := '0';
			end if;
			
			-- EXTENDING THE ARM WHEN PRESSING EXTEND BUTTON
			if ((ext_pos = "0000") AND (xeq = '1') AND (yeq = '1') AND (extend = '1')) then
				ext_en := '1';
				ext_shift := '1';
				desired_ext_pos := "1111";
			end if;
		
		
		when extend_state =>
			-- CATCHING SYSTEM FAULT
			if (NOT(ext_pos = "0000") AND (motion = '1')) then
				x_en := '0';
				y_en := '0';
				sys_fault := '1';
			elsif (ext_pos = "0000") then
				x_en := '0';
				y_en := '0';
				sys_fault := '0';
			end if;
			
			-- EXTEND ARM STATUS
			if (ext_pos = "0000") then
				ext_stat := '0';
			else
				ext_stat := '1';
			end if;
			
			-- ARM EXTENDING OPERATION
			if (ext_pos = desired_ext_pos) then
				ext_en := '0';
				ext_shift := '0';
			end if;
		
		
		when grapple_state =>
			-- CATCHING SYSTEM FAULT
			if (NOT(ext_pos = "0000") AND (motion = '1')) then
				x_en := '0';
				y_en := '0';
				sys_fault := '1';
			end if;
		
			-- GRAPPLE OPERATION
			if ((grapple = '1') AND (ext_pos = "1111")) then
				if (grp_stat = '0') then
					grp_stat := '1';
				elsif (grp_stat = '1') then
					grp_stat := '0';
				end if;
			end if;
			
			-- RETRACTING THE ARM WHEN EXTEND BUTTON IS PRESSED
			if ((grp_stat = '0') AND (extend = '1')) then
				ext_en := '1';
				ext_shift := '0';
				desired_ext_pos := "0000";
			end if;

	end case;

x_out <= x_cur;
y_out <= y_cur;
ext_pos_out <= ext_pos;
ext_stat_out <= ext_stat;
grp_stat_out <= grp_stat;
sys_fault_out <= sys_fault;
	
end process;


end rac;