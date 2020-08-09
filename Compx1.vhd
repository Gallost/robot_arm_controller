library ieee;
use ieee.std_logic_1164.all;

entity Compx1 is port (
	input_a, input_b : in std_logic;
	output_aeqb, output_agtb, output_altb : out std_logic
);
end Compx1;

architecture dataflow of Compx1 is

begin

	output_agtb <= input_a AND (NOT input_b);
	output_altb <= (NOT input_a) AND input_b;
	output_aeqb <= (input_a AND input_b) OR ((NOT input_a) AND (NOT input_B));

end;