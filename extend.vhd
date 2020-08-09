library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity extend is port
	(
		clock, reset, enable, button_in	: in std_logic;
		ext_pos									: in std_logic_vector(3 downto 0);

		status, grp_en							: out std_logic;
		ext_shift_out, ext_en_out			: out std_logic;
		position									: out std_logic_vector(3 downto 0)
	);
end extend;

architecture arm of extend is

signal ext_stat, ext_shift, ext_en, grapple	: std_logic;	-- extender status / extender up or down / UD enable / grapple enable
signal r0, r1, button								: std_logic;
signal tgt_pos											: std_logic_vector(3 downto 0);	-- target arm position


begin

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


process (button, reset) begin

	 -- EVALUATING ONLY IF EXTENDER IS ENABLED (SIGNAL RECEIVED FROM MOTION CONTROLLER)
    if (enable = '1') then

			-- RESETTING THE EXTENDER
        if (reset = '0') then
                tgt_pos       <= "0000";
                ext_en        <= '0';
                ext_shift     <= '0';

		  -- CHECKING IF THE EXTEND BUTTON IS PRESSED
        elsif (button = '1') then

				-- IF CURRENT EXTENDER POSITION IS RETRACTED, SET TARGET POSITION TO "1111"
				-- SHIFTING IS ENABLED, AND SHIFT SIGNAL IS SET TO 1 (SHIFTING "UP")
            if (ext_pos = "0000") then
                tgt_pos      <= "1111";
                ext_en       <= '1';
                ext_shift    <= '1';

				-- IF CURRENT EXTENDER POSITION IS EXTENDED, SET TARGET POSITION TO "0000"
				-- SHIFTING IS ENABLED, AND SHIFT SIGNAL IS SET TO 0 (SHIFTING "DOWN")
            elsif (ext_pos = "1111") then
                tgt_pos      <= "0000";
                ext_en       <= '1';
                ext_shift    <= '0';

            end if;

        end if;


		  -- RESETTING THE GRAPPLE ENABLE SIGNAL AND THE EXTENDER STATUS
        if (reset = '0') then
            grapple 		<= '0';
            ext_stat 	<= '0';

		  -- CHECKING IF THE EXTENDER IS EXTENDED
        elsif (NOT(ext_pos = "0000")) then
				-- IF EXTENDED, SET EXTENSION STATUS TO 1
            ext_stat    <= '1';

				-- ENABLING/DISABLING THE GRAPPLER BASED ON EXTENSION POSITION
            if (ext_pos = "1111") then
                grapple <= '1';
            else
                grapple <= '0';
            end if;

        else
            ext_stat 	<= '0';
				grapple		<= '0';

        end if;

	else
		ext_en	<= '0';

	end if;

end process;

status <= ext_stat;		--Outputting
grp_en <= grapple;
ext_shift_out <= ext_shift;
ext_en_out <= ext_en;
position <= ext_pos;

end;
