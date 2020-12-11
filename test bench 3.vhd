library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity ckt555_tb is
end ckt555_tb;

architecture tb of ckt555_tb is

	component ckt555 is
	port(	clock: in std_logic;
		input1: in std_logic_vector(3 downto 0);	--entity ng 555
		input2: in std_logic_vector(3 downto 0);
		input3: in std_logic_vector(3 downto 0);
		input4: in std_logic_vector(3 downto 0);
		output555: out std_logic);
	end component;

	signal t_input1, t_input2, t_input3, t_input4: std_logic_vector(3 downto 0);
	signal t_clock, t_output555: std_logic;
begin
	unit: ckt555 port map (t_clock, t_input1, t_input2, t_input3, t_input4, t_output555);

	process
	begin
		t_clock <= '0';		--nilagyan ko nito para makitang gumagalaw yung wave every nano second
		wait for 10 ns;		--every 10 ns pala yung interval
		t_clock <= '1';
		wait for 10 ns;
	end process;

	process
	begin
		t_input1 <= "0001";	--1v		--kaya 1v kasi nagchacharge pa capacitor hanggang lumampas sa 6v para mag discharge sya
		t_input2 <= "0110";	--6v
		t_input3 <= "0011";	--3v
		t_input4 <= "0001";	--1v
		
		loop						--unli loop to kasi pag reset simulation, babalik sa 1v yung input
			wait for 10 ns;				--e ayaw natin ganon kasi hindi yung ang function ng capacitor ayun sa video
			if(t_output555 = '1') then
				t_input1 <= t_input1 + '1';	
				t_input4 <= t_input4 + '1';
			elsif(t_output555 = '0') then
				t_input1 <= t_input1 - '1';
				t_input4 <= t_input4 - '1';
			end if;
		end loop;
	end process;

	
end tb;

configuration cfg_tb of ckt555_tb is
	for tb
	end for;
end cfg_tb;