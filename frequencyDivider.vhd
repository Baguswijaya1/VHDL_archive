-- frequency divider
library ieee;
use ieee.std_logic_1164.all;

entity freqDivider is
    port(
        clk_in : in std_logic; -- clock signal
        rst : in std_logic; -- reset signal
        clk_out : out std_logic -- divided frequency
    );
end freqDivider;

architecture behavior of freqDivider is
signal count_int : integer range 0 to 1; -- internal count  
signal num : std_logic;
begin
    process(rst, clk_in)
    begin
		if (rst = '1') then
			count_int <= 0;
			num <= '0';
		elsif rising_edge(clk_in) then 
			if (count_int = 1) then 
				count_int <= 0;
				num <= NOT num;
			else 
				count_int <= count_int + 1;
			end if;
		end if;
    end process;
	clk_out <= num;
	
	
end behavior;
