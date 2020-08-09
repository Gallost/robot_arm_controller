-- Group 3, Adrian Salvador & Harry He --

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shift_reg_4bit is port
	(
		CLK				: in std_logic := '0';
		RESET_n			: in std_logic := '0';
		CLK_EN			: in std_logic := '0';
		LEFT0_RIGHT1	: in std_logic := '0';
		REG_BITS			: out std_logic_vector(3 downto 0)
	);
end entity;


architecture one of shift_reg_4bit is

	signal sreg	: std_logic_vector(3 downto 0);
	
begin


process (CLK, RESET_n) is

begin

	if (RESET_n = '0') then
		sreg <= "0000";
	
	elsif (rising_edge(CLK) AND (CLK_EN = '1')) then
	
		if (LEFT0_RIGHT1 = '1') then
			sreg(3 downto 0) <= '1' & sreg(3 downto 1);
			
		elsif (LEFT0_RIGHT1 = '0') then
			sreg(3 downto 0) <= sreg(2 downto 0) & '0';
			
		end if;
		
	end if;
	
end process;
REG_BITS <= sreg;

END one;