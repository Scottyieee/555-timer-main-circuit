library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use work.all;			--gamit to, magagamit na natin mga previous files ng code na ginawa natin kanina

entity ckt555 is		--dito natin pagcoconect para maging 555 na sya yey HAHAHA, para ka lang nagkakabit ng wires

port(	clock: in std_logic;
	input1: in std_logic_vector(3 downto 0);	--so gawa ng panibagong inputs eto na yung sinabi ko sa ppt
	input2: in std_logic_vector(3 downto 0);
	input3: in std_logic_vector(3 downto 0);
	input4: in std_logic_vector(3 downto 0);
	output555: out std_logic);

end ckt555;

architecture struct of ckt555 is

	component comparator1 is
	port(	a1:	in std_logic_vector(3 downto 0);	--entity of comparator
		b1:	in std_logic_vector(3 downto 0);
		output1:	out std_logic);
	end component;

	component comparator2 is
	port(	a2:	in std_logic_vector(3 downto 0);	--entity of comparator2
		b2:	in std_logic_vector(3 downto 0);
		output2:	out std_logic);
	end component;

	component srflip is
	port(	r, s:		in std_logic;			--entity of srflip
		q, qbar:	out std_logic);			--di naman ginamit talaga dito q kasi di din sya gamit sa 555
	end component;						--nilagay ko lang for consistency

	signal wire1: std_logic;	--parang wires lang talaga to sa actual
	signal wire2: std_logic;
	signal wire3: std_logic;

begin

	circuit1: comparator1 port map (a1 => input1, b1 => input2, output1 => wire1);		--self explanatory na lang naman to
	circuit2: comparator2 port map (a2 => input3, b2 => input4, output2 => wire2);		--kelangan muna nyang mastore sa wire 
	circuit3: srflip port map (r => wire1, s => wire2, qbar => wire3);			--kasi di ata mareread kapag diretso kabit agad sa r at s yung output ng comparator 1 at 2 

	output555 <= not wire3;		--dito na yung NOT gate 

end struct;







