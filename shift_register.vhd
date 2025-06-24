-- shift register

library ieee;
use ieee.std_logic_1164.all;

entity shift_register is
	generic (N : integer := 32);
	port(
		clk, load : in std_logic;
		shift_in : in std_logic;
		shift_out : out std_logic);
end shift_register;

architecture behavior of shift_register is
	signal shift_reg : std_logic_vector((N-1) downto 0);
begin
	process (clk) begin
		if rising_edge(clk) then
			shift_reg <= shift_reg((N-2) downto 9) & shift_in;
		end if;
		shift_out <= shift_reg(N-1);
	END PROCESS;
end behavior;
	
