library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_ARITH.ALL;
use IEEE.std_logic_UNSIGNED.ALL;

entity DEMULTIPLEXER1_2 is
	Port( DIN : in STD_LOGIC;
			S : in STD_LOGIC;
			Y : out STD_LOGIC_VECTOR(1 downto 0));
end DEMULTIPLEXER1_2;

architecture Data_flow of DEMULTIPLEXER1_2 is
begin
	Y <= '1' & DIN when S = '0' else
		  DIN & '1';
end Data_flow;