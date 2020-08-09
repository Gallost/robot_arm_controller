-- Group 3, Adrian Salvador & Harry He --

library ieee;
use ieee.std_logic_1164.all;

entity Compx4 is port (
	inA_4bit, inB_4bit					: in std_logic_vector(3 downto 0);
	aeqb_4bit, agtb_4bit, altb_4bit	: out std_logic
);
end Compx4;

architecture dataflow of Compx4 is

	component Compx1 port (
	input_a, input_b : in std_logic;
	output_aeqb, output_agtb, output_altb : out std_logic
	);
	end component;
	
	signal x1, x2,  x3,  x4,
			 x5, x6,  x7,  x8,
			 x9, x10, x11, x12 : std_logic;
	-- Declaring signals here for the outputs of the instance of Compx1 for the 
	-- final boolean algebraic expressions.
	
begin
	
	inst0: Compx1 port map (	-- Least significant bit
	inA_4bit(0), inB_4bit(0),
	x11, x12, x10
	);
	
	inst1: Compx1 port map (
	inA_4bit(1), inB_4bit(1),
	x8, x9, x7
	);
	
	inst2: Compx1 port map (
	inA_4bit(2), inB_4bit(2),
	x5, x6, x4
	);
	
	inst3: Compx1 port map (	-- Most significant bit
	inA_4bit(3), inB_4bit(3),
	x2, x3, x1
	);
	
	altb_4bit <= x1 OR (x2 AND x4) OR (x2 AND x5 AND x7) OR (x2 AND x5 AND x8 AND x10);
	agtb_4bit <= x3 OR (x2 AND x6) OR (x2 AND x5 AND x9) OR (x2 AND x5 AND x8 AND x12);
	aeqb_4bit <= x2 AND x5 AND x8 AND x11;
	-- Corresponds to the expression derived from the truth table
	
end;