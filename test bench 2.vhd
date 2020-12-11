library ieee;
use ieee.std_logic_1164.all;

entity srflip_tb is
end srflip_tb;

architecture tb of srflip_tb is

	component srflip is
		port(	r, s:		in std_logic;
			q, qbar:	out std_logic);
	end component;

	signal tr, ts: std_logic;		--pwede din pala baguhin variable name nya sa signal
	signal tq, tqbar: std_logic;

begin
	unit: srflip port map (tr, ts, tq, tqbar);	--basta maghalaga is mapagconnect natin sya sa port map keme

	process
		begin
			tr <= '1';
			ts <= '0';
			wait for 10 ns;

			tr <= '0';
			ts <= '0';	--stored data ng tr <= 1 at ts <= 0
			wait for 10 ns;

			tr <= '0';
			ts <= '1';	
			wait for 10 ns;
			
			tr <= '0';
			ts <= '0';	--sameeee
			wait for 10 ns;
		wait;
	end process;
end tb;

configuration cfg_tb of srflip_tb is
	for tb
	end for;
end cfg_tb;