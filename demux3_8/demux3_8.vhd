library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity demux3_8 is
	Port( D:in STD_LOGIC;
			S:in STD_LOGIC_VECTOR(2 downto 0);
			Y:out STD_LOGIC_VECTOR(7 downto 0));
end demux3_8;

architecture mux of demux3_8 is
	signal X:STD_LOGIC_VECTOR(3 downto 0);
begin
	demux2_4:block
	begin
		process(S(2 downto 1),D)
			begin
			case S(2 downto 1) is
				when "00"=>X<="000"&D;
				when "01"=>X<="00"&D&'0';
				when "10"=>X<='0'&D&"00";
				when others=>X<=D&"000";
			end case;
		end process;
	end block demux2_4;
	
	demux1_2_1:block
	begin
		process(S(0),X)
			begin
				if S(0) = '0' then
					Y(1 downto 0)<='0'&X(0);
				else
					Y(1 downto 0)<=X(0)&'0';
				end if;
		end process;
	end block demux1_2_1;	
	
	demux1_2_2:block
	begin
		process(S(0),X)
			begin
				if S(0) = '0' then
					Y(3 downto 2)<='0'&X(1);
				else
					Y(3 downto 2)<=X(1)&'0';
				end if;	
		end process;
	end block demux1_2_2;

	demux1_2_3:block
	begin
		process(S(0),X)
			begin
				if S(0) = '0' then
					Y(5 downto 4)<='0'&X(2);
				else
					Y(5 downto 4)<=X(2)&'0';
				end if;	
		end process;
	end block demux1_2_3;

	demux1_2_4:block
	begin
		process(S(0),X)
			begin
				if S(0) = '0' then
					Y(7 downto 6)<='0'&X(3);
				else
					Y(7 downto 6)<=X(3)&'0';
				end if;
		end process;
	end block demux1_2_4;	
end mux;