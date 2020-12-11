library ieee;
use ieee.std_logic_1164.all;		--mahalaga to para gumana code (para syang sub library)
use ieee.std_logic_unsigned.all;	--mahalaga to para walang negative sign sa value
use ieee.std_logic_arith.all;		--mahalaga to paara magamit natin mga math operations (+, -, *, keme)

entity comparator1_tb is
end comparator1_tb;

architecture tb of comparator1_tb is

	component comparator1 is					--declare natin dito entity ng comparator 1 para magamit natin code nya
		port(	a1:	in std_logic_vector(3 downto 0);
			b1:	in std_logic_vector(3 downto 0);
			output1:	out std_logic);
	end component;

	signal a1, b1: std_logic_vector(3 downto 0) := "0000";		--sa pagtetest, sa signal dapat ilalagay input, kokopyahin nyo lang naman yung nasa port 
	signal output1: std_logic;
begin
	unit: comparator1 port map (a1, b1, output1);		--kelangan nito para mapagkabit yung signal at component (up to down or left to right dapat pagkakasunod-sunod)

	process
	begin
		a1 <= "1001";	--9	--dapat high('1') lalabas sa output1 kase a1 > b1 sabi sa behv ng comparator
		b1 <= "0000";	--0
		wait for 10 ns; --duration sa pagprocess ng input(ns)

		a1 <= "0001";	--1
		b1 <= "1000";	--8
		wait for 10 ns;
	wait;	--to stop
	end process;
end tb;

configuration cfg_tb of comparator1_tb is	----parepareho lang naman pattern nya sa pagcocode ng test bench nagvavary lang sa inputs at outputs na nilalagay natin
	for tb
	end for;
end cfg_tb;