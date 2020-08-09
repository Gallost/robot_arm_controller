library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;

entity full_adder_4bit is
 	port (
			cin							: in std_logic;
			hex_val_A, hex_val_B 	: in std_logic_vector(3 downto 0);
			hex_sum 						: out std_logic_vector(3 downto 0);
		   carry_out					: out std_logic
			);
end full_adder_4bit;

architecture Circuit of full_adder_4bit is

-- Declare any Components to be Used ---
-------------------------------------------------------------------

component full_adder_1bit
 	port (
			cin, bit_val1, bit_val2 	: in std_logic;
			bit_sum 							: out std_logic;
		   carry_out_bit					: out std_logic
			);
end component;

-------------------------------------------------------------------

-- Declare any signals to be used within the design---
-------------------------------------------------------------------
-- group of 4 logic signals with the group type defined as std_logic_vector(MSB downto LSB)
	signal cout	: std_logic_vector(3 downto 0);

-------------------------------------------------------------------
-------------------------------------------------------------------
-- add instances to complete the Full_Adder_4bit design
begin

adder0: full_adder_1bit port map (cin, hex_val_A(0), hex_val_B(0), hex_sum(0), cout(0));

adder1: full_adder_1bit port map (cout(0), hex_val_A(1), hex_val_B(1), hex_sum(1), cout(1));

adder2: full_adder_1bit port map (cout(1), hex_val_A(2), hex_val_B(2), hex_sum(2), cout(2));

adder3: full_adder_1bit port map (cout(2), hex_val_A(3), hex_val_B(3), hex_sum(3), cout(3));

carry_out <= cout(3);

end circuit;
