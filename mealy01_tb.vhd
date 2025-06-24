library ieee;
use ieee.std_logic_1164.all;

entity mealy01_tb is
end mealy01_tb;

architecture behavior of mealy01_tb is
	-- signal
	constant clock_period : time := 10 ns;
	signal clk 		: std_logic := '0';
	signal input	: std_logic := '0';
	signal output	: std_logic := '0';
	signal rst		: std_logic := '0';
	
	-- component
	component mealy01
	port(
		input	: in std_logic;
		output	: out std_logic;
		clk, rst: in std_logic
	);
	end component;
	
	begin
	-- uut
	uut: mealy01
		port map(
			input 	=> input,
			output	=> output,
			clk		=> clk,
			rst		=> rst
		);
	
	-- clock process
	clock_process : process
	begin
		while true loop
			clk <= '1';
			wait for clock_period/2;
			clk <= '0';
			wait for clock_period/2;
		end loop;
	end process;
	
	-- stim process
	stim_process : process
	begin
		rst <= '1';
		wait for 2*clock_period;
		rst <= '0';
		wait for clock_period;
		
		input <= '1';
		wait for clock_period;
		input <= '0';
		wait for clock_period;
		input <= '1';
		wait for clock_period;
		input <= '0';
		wait for clock_period;
		input <= '1';
		wait for clock_period;
		input <= '0';
		wait for clock_period;
		input <= '0';
		wait for clock_period;
		input <= '1';
		wait for clock_period;
		input <= '1';
		wait for clock_period;
	end process;
end behavior;