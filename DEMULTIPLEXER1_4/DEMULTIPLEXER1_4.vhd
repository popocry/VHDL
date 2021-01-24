library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_ARITH.ALL;
use IEEE.std_logic_UNSIGNED.ALL;

entity DEMULTIPLEXER1_4 is
	Port( DIN : in STD_LOGIC;
			S : in STD_LOGIC_VECTOR(1 downto 0);
			Y : out STD_LOGIC_VECTOR(3 downto 0));
end DEMULTIPLEXER1_4;

architecture Data_flow of DEMULTIPLEXER1_4 is
	component DEMULTIPLEXER1_2
		Port( DIN : in STD_LOGIC;
			S : in STD_LOGIC;
			Y : out STD_LOGIC_VECTOR(1 downto 0));
	end component;
	signal X : STD_LOGIC_VECTOR(1 downto 0);
begin

DEMUL1 : DEMULTIPLEXER1_2
			port map(DIN,S(1),X);
LOP : for i in 0 to 1 generate
			DEMUL2 : DEMULTIPLEXER1_2
						Port map (X(i),S(0),Y(2*i+1 downto 2*i));
		end	generate LOP;
end Data_flow;		