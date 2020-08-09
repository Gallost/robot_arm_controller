library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;

entity full_adder_1bit is
 	port (
			cin, bit_val1, bit_val2 	: in std_logic;
			bit_sum 							: out std_logic;
		   carry_out_bit					: out std_logic
			);
end full_adder_1bit;

architecture Circuit of full_adder_1bit is

-- Declare any Components to be Used ---
-------------------------------------------------------------------
-------------------------------------------------------------------

-- Declare any signals to be used within the design---
-------------------------------------------------------------------

signal half_adder_sum, half_adder_carry	: std_logic;

-------------------------------------------------------------------
-------------------------------------------------------------------

begin

half_adder_carry 		<= bit_val1 AND bit_val2;

half_adder_sum 		<= bit_val1 XOR bit_val2;

-- complete the Boolean equation for bit_sum
bit_sum 					<= half_adder_sum XOR cin;

-- complete the Boolean equation for carry_out_bit
carry_out_bit 			<= (half_adder_sum AND cin) OR half_adder_carry;


end;
