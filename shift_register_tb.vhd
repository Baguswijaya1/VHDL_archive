library ieee;
use ieee.std_logic_1164.all;

entity shift_register_tb is
end shift_register_tb;

architecture behavior of shift_register_tb is

    -- constants
    constant N : integer := 8;  -- bisa diganti sesuai kebutuhan
    constant clock_period : time := 10 ns;

    -- component declaration
    component shift_register
        generic (N : integer := 32);
        port(
            clk, load : in std_logic;
            shift_in : in std_logic;
            shift_out : out std_logic
        );
    end component;

    -- signals
    signal clk_tb     : std_logic := '0';
    signal load_tb    : std_logic := '0'; -- tidak digunakan dalam arsitektur
    signal shift_in_tb : std_logic := '0';
    signal shift_out_tb : std_logic;

begin

    -- instantiate the unit under test (UUT)
    uut: shift_register
        generic map (N => N)
        port map (
            clk       => clk_tb,
            load      => load_tb,
            shift_in  => shift_in_tb,
            shift_out => shift_out_tb
        );

    -- Clock generation
    clk_process : process
    begin
        while true loop
            clk_tb <= '0';
            wait for clock_period / 2;
            clk_tb <= '1';
            wait for clock_period / 2;
        end loop;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        wait for clock_period;

        -- shift in bits 1, 0, 1, 1 sequentially
        shift_in_tb <= '1';
        wait for clock_period;
        shift_in_tb <= '0';
        wait for clock_period;
        shift_in_tb <= '1';
        wait for clock_period;
        shift_in_tb <= '1';
        wait for clock_period;

        -- wait and observe output
        wait for 10 * clock_period;
        wait;
    end process;

end behavior;
