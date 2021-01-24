library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_ARITH.ALL;
use IEEE.std_logic_UNSIGNED.ALL;

entity PARITY_DETECTOR is
	Port( CLK : in STD_LOGIC;
			RESET : in STD_LOGIC;
			X : in STD_LOGIC;
			Z : out STD_LOGIC);
end PARITY_DETECTOR;

architecture Behavior_arch of PARITY_DETECTOR is
	type State is (S1,S0);
	signal Present_State : State;
	signal Next_State : State;

begin
	process(CLK,RESET)
		begin
			if RESET = '0' then 
				Present_State <= S0;
			elsif CLk'event and CLK = '1' then
				Present_State <= Next_State;
			end if;
	end process;
	
	process(Present_State,X)
		begin
			case Present_State is
				when S0 =>
					if X ='0' then
						Next_State <= S0;
					else
						Next_State <= S1;
					end if;
					Z <= '0';
				when S1 =>
					if X ='0' then
						Next_State <= S1;
					else
						Next_State <= S0;
					end if;
					Z <= '1';
			end case;
	end process;
end Behavior_arch;