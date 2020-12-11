library ieee;
use ieee.std_logic_1164.all;

---------------------------------------------------

entity comparator1 is

generic(n: natural := 4);				--kelangan nung generic keme kase nagbabago input (i think haha meron din kasi ganyan sa example kaya ginaya ko lang)
port(	a1:	in std_logic_vector(n-1 downto 0);	--4 bit ("0000") gamit natin since 0 to 9 possible nating iinput na values
	b1:	in std_logic_vector(n-1 downto 0);
	output1:	out std_logic);

end comparator1;

---------------------------------------------------

architecture behv of comparator1 is	--Kapag high = 1 tas low = 0 para mapagkumpara ko pumapasok na voltage kagaya nung sa actual
		
begin 
    
    process(a1, b1)			--Kapareho lang nito yung behv ng comparator2 binago ko lang variable names
    begin
        if (a1 > b1) then 
		output1 <= '1';		 
	else  				
		output1 <= '0';		--Kung nakita nyo na yung example code ng comparator sa digitams,	
	end if;				--binago ko ng slight at di naman mahalaga A=B kaya sinet ko na lang din na 0 yung output nya kaya else
    end process;			--Itest nyo na lang kung para makita natin sa simulation (Test bench 1)

end behv;
