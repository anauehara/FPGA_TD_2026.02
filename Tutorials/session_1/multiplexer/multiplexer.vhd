library ieee;
use ieee.std_logic_1164.all;

entity multiplexer is 
    port (
        A : in std_logic;
        B : in std_logic;
        S : in std_logic;
        D : out std_logic
    );
end entity multiplexer;

architecture rtl of multiplexer is
begin 
    D <= B when S <= '0' else
         A when S <= '1' else 
         'U';
end architecture rtl; 
