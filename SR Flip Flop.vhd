library ieee;
use ieee.std_logic_1164.all;

entity srflip is

port(	r, s:		in std_logic;
	q, qbar:	out std_logic);		--kokopyahin ko na lng sana yung nasa example sa digitams kaso nagloloko simulation kapag buffer ginamit ko
						--kaya out std_logic yan
end srflip;					--Dahil dito, binago ko na lahat hindi ako gumamit ng NOR at NAND gate kagaya nung nasa example 
						--gumawa ako ng sarili ko pero magkapareho lng naman sila ng behv
architecture behv of srflip is

	signal state: std_logic;
	signal input: std_logic_vector(1 downto 0); --2bit input
begin
	input <= r & s;		--pinagdikit o pinagconcatenate ko silang dalawa sa input para magamit ko sa case

	process(r, s)
	begin
		state <= '0';		--mahalaga to para magkaron na starting value ('0') dahil di gagana output kapag wala
		case (input) is
			when "10" => state <= '0';	--magkapareho lang naman concept ng case dito iba lang structure ng syntax
			when "01" => state <= '1';
			when "00" => state <= not state;	--dito maiistore yung data (like magigi lang syang kagaya nung previous output)
			when others => null;
		end case;
	end process;
	
	q <= state;
	qbar <= not state;		--try na lang natin sa test bench 2 :>
			
end behv;