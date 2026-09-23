library ieee;
use ieee.std_logic_1164.all;

entity multiplexer_tb is 
end entity multiplexer_tb;

architecture tb of multiplexer_tb is 
    signal tb_a : std_logic;
    signal tb_b : std_logic;
    signal tb_s : std_logic;
    signal tb_d : std_logic;
begin 
    uut : entity work.multiplexer
        port map (
            a => tb_a,
            b => tb_b,
            s => tb_s,
            d => tb_d
        );

    process
    begin 
        tb_s <= '0';
        tb_a <= '0';
        tb_b <= '0';
        wait for 10 ns;
        tb_s <= '0';
        tb_a <= '0';
        tb_b <= '1';
        wait for 10 ns;
        tb_s <= '0';
        tb_a <= '1';
        tb_b <= '0';
        wait for 10 ns;
        tb_s <= '0';
        tb_a <= '1';
        tb_b <= '1';
        wait for 10 ns;
        tb_s <= '1';
        tb_a <= '0';
        tb_b <= '0';
        wait for 10 ns;
        tb_s <= '1';
        tb_a <= '0';
        tb_b <= '1';
        wait for 10 ns;
        tb_s <= '1';
        tb_a <= '1';
        tb_b <= '0';
        wait for 10 ns;
        tb_s <= '1';
        tb_a <= '1';
        tb_b <= '1';
        wait for 10 ns;
        wait;
    end process;
end architecture tb;
        