library ieee;
use ieee.std_logic_1164.all;

entity dff_tb is
end entity dff_tb;

architecture tb of dff_tb is
    -- são como fios ligados no microprocessador 
    signal tb_i_clk : std_logic;
    signal tb_i_rst_n : std_logic;
    signal tb_i_en : std_logic;
    signal tb_i_d : std_logic;
    signal tb_o_q : std_logic;

    signal finished : boolean := false;
begin
    uut : entity work.dff
    port map (
        i_clk => tb_i_clk,
        i_rst_n => tb_i_rst_n,

        i_en => tb_i_en,
        i_d => tb_i_d,
        o_q => tb_o_q
    );

    -- Generates the clock independently of the other signals
    process
    -- não tem sensibilidade, utiliza o wait for
    begin
        tb_i_clk <= '0'; wait for 10 ns;
        tb_i_clk <= '1'; wait for 10 ns;
        
        -- flag usada para parar o clock
        if (finished = true) then
            wait;
        end if;
    end process;

    -- Generates the other signals
    process
    begin
        tb_i_rst_n <= '0';
        tb_i_en <= '0';
        tb_i_d <= '0';
        -- esperar ate a borda descer, nao faz a borda descer, apenas detecta se a borda esta descendo ou nao
        wait until falling_edge(tb_i_clk);
        wait until falling_edge(tb_i_clk);

        tb_i_rst_n <= '1';

        wait until falling_edge(tb_i_clk);

        tb_i_d <= '1';

        wait until falling_edge(tb_i_clk);

        tb_i_en <= '1';

        wait until falling_edge(tb_i_clk);
        wait until falling_edge(tb_i_clk);

        tb_i_d <= '0';

        wait until falling_edge(tb_i_clk);

        tb_i_d <= '1';

        wait until falling_edge(tb_i_clk);

        tb_i_rst_n <= '0';

        wait until falling_edge(tb_i_clk);

        tb_i_rst_n <= '1';

        wait until falling_edge(tb_i_clk);

        finished <= true;
        wait;
    end process;
end architecture tb;