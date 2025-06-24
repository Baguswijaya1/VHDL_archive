-- frequency divider testbench

library ieee;
use ieee.std_logic_1164.all;

entity freqDivider_tb is
end freqDivider_tb;

architecture behavior of freqDivider_tb is
-- define clock period
constant clock_period : time := 10 ns; -- create 100 MHz clock


-- define component under test
component freqDivider
	port (
		clk_in : in std_logic;
		rst : in std_logic;
		clk_out : out std_logic
	);
end component;

-- declare signals for interconnection
signal clock_in : std_logic := '0';
signal reset	: std_logic := '0';
signal clock_out: std_logic;

begin
-- instantinate the component
uut : freqDivider
	port map(
		clk_in 	=> clock_in,
		clk_out=> clock_out,
		rst		=> reset
	);
	
-- create clock process
clock_process : process
begin
	while true loop
		clock_in  <= '0';
		wait for clock_period/2;
		clock_in <= '1';
		wait for clock_period/2;
	end loop;
end process;

-- apply stimulus
stim_proc : process
begin
	reset <= '1';
	wait for clock_period * 10;
	reset <= '0';
	wait;
end process;

end behavior;
