library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_ARITH.ALL;
use IEEE.std_logic_UNSIGNED.ALL;

entity DFFA is
	Port( DIN : in STD_LOGIC;
			CLK : in STD_LOGIC;
			RESET : in STD_LOGIC;
			Q : out STD_LOGIC);
end DFFA;

architecture DFF_arch of DFFA is

begin
	process(CLK, RESET)
		begin
			if RESET = '0' then
				Q <= '0';
			elsif CLK'event and CLK = '1' then
				Q <= DIN;
			end if;
	end process;
end DFF_arch;