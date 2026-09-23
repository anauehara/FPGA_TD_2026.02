library ieee;
use ieee.std_logic_1164.all;

entity dff is
    -- unidade básica de memória
    port (
        i_clk : in std_logic;
        i_rst_n : in std_logic; -- for question 5

        i_en : in std_logic;    -- for question 6
        i_d : in std_logic;
        o_q : out std_logic
    );
end entity dff;

architecture rtl of dff is
    -- It's a good idea to initialize all the registers
    -- I do it here instead of in the entity because I find it to be cleaner
    -- eh o valor inicial iniciado em 0
    -- o nome r_ quer dizer que eh um registrador
    signal r_q : std_logic := '0';
begin
    -- process sequencial 
    process(i_clk, i_rst_n)
    begin
        if (i_rst_n = '0') then     -- question 5
            r_q <= '0';
        elsif (rising_edge(i_clk)) then
            if (i_en = '1') then    -- question 6
                r_q <= i_d;
            end if;
        -- não atribuir nada significa manter o valor
        end if;
    end process;
    -- atribuindo o valor do registrador para o sinal de saida
    o_q <= r_q;     -- don't forget that one !
end architecture rtl;