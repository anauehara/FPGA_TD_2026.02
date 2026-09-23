library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_tb is
    -- entity no tb eh sempre vazia
end entity alu_tb;

architecture tb of alu_tb is
    constant BUS_WIDTH : positive := 8;
    
    signal tb_i_sel : integer range 0 to 7;
    signal tb_i_operand_a : unsigned(BUS_WIDTH-1 downto 0);
    signal tb_i_operand_b : unsigned(BUS_WIDTH-1 downto 0);
    signal tb_o_result : unsigned(BUS_WIDTH-1 downto 0);
begin
    uut: entity work.alu
        generic map (
            BUS_WIDTH => BUS_WIDTH
        )
        port map (
            i_sel => tb_i_sel,
            i_a => tb_i_operand_a,
            i_b => tb_i_operand_b,
            o_result => tb_o_result
        );

    process
    begin
        tb_i_operand_a <= x"0C";
        tb_i_operand_b <= x"03";

        tb_i_sel <= 0; wait for 10 ns;
        tb_i_sel <= 1; wait for 10 ns;
        tb_i_sel <= 2; wait for 10 ns;
        tb_i_sel <= 3; wait for 10 ns;
        tb_i_sel <= 4; wait for 10 ns;
        tb_i_sel <= 5; wait for 10 ns;
        tb_i_sel <= 6; wait for 10 ns;
        tb_i_sel <= 7; wait for 10 ns;

        wait;
    end process;

end architecture tb;