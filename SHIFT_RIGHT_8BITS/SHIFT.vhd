library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_ARITH.ALL;
use IEEE.std_logic_UNSIGNED.ALL;

entity SHIFT is
	generic(number : integer range 1 to 31 :=1);
	Port( DIN : in STD_LOGIC;
			CLK : in STD_LOGIC;
			RESET : in STD_LOGIC;
			Q : out STD_LOGIC_VECTOR(0 to number-1));
end SHIFT;

architecture SHIFT_arch of SHIFT is
	signal REG : std_logic_vector(1 to number);
	
	component DFFA
		Port( DIN : in STD_LOGIC;
				CLK : in STD_LOGIC;
				RESET : in STD_LOGIC;
				Q : out STD_LOGIC);
	end component DFFA;
	
begin
	LOP: for i in 0 to number-1 generate
		FIRST: if i = 0 generate
			DFF0: DFFA Port map (DIN,CLK,RESET,REG(i+1));
					end generate;
		OTHER: if i >0 and i < number generate
			DFFO: DFFA Port map (REG(i),CLK,RESET,REG(i+1));
					end generate;
	end generate LOP;
	Q <= REG;
end SHIFT_arch;