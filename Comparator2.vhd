library ieee;
use ieee.std_logic_1164.all;

---------------------------------------------------

entity comparator2 is

generic(n: natural := 4);
port(	a2:	in std_logic_vector(n-1 downto 0);
	b2:	in std_logic_vector(n-1 downto 0);
	output2:	out std_logic);

end comparator2;

---------------------------------------------------

architecture behv of comparator2 is

begin 
    
    process(a2, b2)
    begin
        if (a2 > b2) then 
		output2 <= '1';
	else   
		output2 <= '0';
	end if;
    end process;

end behv;
