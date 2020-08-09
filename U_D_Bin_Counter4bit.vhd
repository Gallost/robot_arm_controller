-- Group 3, Adrian Salvador & Harry He --

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity U_D_Bin_Counter4bit is port
	(
		CLK				: in std_logic := '0';
		RESET_n			: in std_logic := '0';
		CLK_EN			: in std_logic := '0';
		UP1_DOWN0		: in std_logic := '0';
		COUNTER_BITS	: out std_logic_vector(3 downto 0)
	);
end entity;

architecture one of U_D_Bin_Counter4bit is

	signal ud_bin_counter : unsigned(3 downto 0);
	signal up_ok, dw_ok	 : std_logic;
	
begin


process (CLK, RESET_n) is

begin
	
	if (ud_bin_counter = "0000") then
		up_ok	<= '1';
		dw_ok	<= '0';
	elsif (ud_bin_counter = "1111") then
		up_ok <= '0';
		dw_ok <= '1';
	else
		up_ok	<= '1';
		dw_ok	<= '1';
	end if;


	if (RESET_n = '0') then
		ud_bin_counter <= "0000";
		
	elsif (rising_edge(CLK)) then
	
		if ((UP1_DOWN0 = '1') AND (CLK_EN = '1') AND (up_ok = '1')) then
			ud_bin_counter <= (ud_bin_counter + 1);
			
		elsif ((UP1_DOWN0 = '0') AND (CLK_EN = '1') AND (dw_ok = '1')) then
			ud_bin_counter <= (ud_bin_counter - 1);
			
		end if;
		
	end if;
	
end process;

COUNTER_BITS <= std_logic_vector(ud_bin_counter);

end;