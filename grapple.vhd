-- Group 3, Adrian Salvador & Harry He --
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity grapple is port
	(
		clock, reset				: in std_logic;
		enable, button_in			: in std_logic;
		
		status						: out std_logic
	);
end grapple;

architecture grappler of grapple is

signal grp_stat			: std_logic;	-- Grapple Enable Signal
signal r0, r1, button	: std_logic;

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


process (clock, button) begin

	-- RESETTING GRAPPLE
	if (reset ='0') then
		grp_stat <= '0';
	
	elsif (rising_edge(clock)) then
	
		if (button = '1' AND enable = '1') then
			grp_stat	<= NOT(grp_stat);
		else
			grp_stat	<= grp_stat;
		end if;
		
	end if;
	
end process;


status <= grp_stat;	-- Outputting

end grappler;
