library ieee;
use ieee.std_logic_1164.all;

entity mealy01 is
	port(
		input	: in std_logic;
		output	: out std_logic;
		clk, rst: in std_logic
	);
end mealy01;

architecture behavior of mealy01 is
-- signal
	type states is (q0, q1, q2);
	signal current_state, next_state	: states;
	signal temp_out : std_logic;
begin
-- logic process
process(clk, rst)
begin
	if rst = '1' then
		current_state <= q0;
	elsif rising_edge(clk) then
		current_state <= next_state;	
		output <= temp_out;
	end if;
end process;

process(current_state)
begin
	case current_state is
		when q0 =>
			if input = '0' then 
				next_state <= q1;
				temp_out<= '0';
			elsif input = '1' then
				next_state <= q1;
				temp_out <= '0';
			end if;
		when q1 =>
			if input = '0' then
				next_state <= q1;
				temp_out <= '0';
			elsif input = '1' then
				next_state <= q2;
				temp_out <= '1';
			end if;
		when q2 =>
			if input = '0' then
				next_state <= q1;
				temp_out <= '0';
			elsif input = '1' then
				next_state <= q0;
				temp_out <= '0';
			end if;
	end case;
end process;
end behavior;