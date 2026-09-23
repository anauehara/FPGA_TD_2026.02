library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is 
    generic (
        bus_width : positive := 8
    );
    port (
        i_sel: in integer range 0 to 7;
        i_a: in unsigned(bus_width-1 downto 0);
        i_b: in unsigned(bus_width-1 downto 0);
        o_result: out unsigned(bus_width-1 downto 0)
    );
end entity alu;

architecture rtl of alu is
begin 
    -- dentro de um process as linhas são lidas em ordem
    process(i_sel, i_a, i_b) -- essa lista diz quem realmente importa no process
        variable product: unsigned(bus_width*2-1 downto 0);
    begin   
        case i_sel is
            when 0 =>
                o_result <= i_a +i_b;
            when 1 => 
                o_result <= i_a - i_b;
            when 2 =>
                product := i_a * i_b; -- aqui a multiplicação faz com que o resultado tenha 16 bits
                -- eh preciso cortar o resultado e o vhdl só deixa cortar variáveis nomeadas 
                o_result <= product(bus_width-1 downto 0);
            when 3 =>
                o_result <= i_a / i_b;
            when 4 =>
                o_result <= i_a or i_b;
            when 5 =>
                o_result <= i_a and i_b;
            when 6 =>
                o_result <= i_a xor i_b;
            when 7 =>
                o_result <= not(i_a);
        end case 
    end process;
end architecture rtl;
            