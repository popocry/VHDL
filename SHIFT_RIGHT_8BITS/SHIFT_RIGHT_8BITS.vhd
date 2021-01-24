library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_ARITH.ALL;
use IEEE.std_logic_UNSIGNED.ALL;

entity SHIFT_RIGHT_8BITS is
	Port( DIN : in STD_LOGIC;
			CLK : in STD_LOGIC;
			RESET : in STD_LOGIC;
			Q : out STD_LOGIC_VECTOR(0 to 7));
end SHIFT_RIGHT_8BITS;

architecture SHIFT_RIGHT_8BITS_arch of SHIFT_RIGHT_8BITS is

	component SHIFT
		generic(number : integer range 1 to 31);
		Port( DIN : in STD_LOGIC;
				CLK : in STD_LOGIC;
				RESET : in STD_LOGIC;
				Q : out STD_LOGIC_VECTOR(0 to number-1));
	end component SHIFT;

begin
	SR:SHIFT
		generic map(8)
			Port map (DIN,CLK,RESET,Q);
end SHIFT_RIGHT_8BITS_arch;
