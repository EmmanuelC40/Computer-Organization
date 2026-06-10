library ieee;
use ieee.std_logic_1164.all;

entity MUX4to1_8bit is
    port(
        A, B, C, D : in std_logic_vector(7 downto 0);
        S          : in std_logic_vector(1 downto 0);
        O          : out std_logic_vector(7 downto 0)
    );
end entity;

architecture MUX4to1_8bitArch of MUX4to1_8bit is
begin
    process(S, A, B, C, D)
    begin
        case S is
            when "00" => O <= A;
            when "01" => O <= B;
            when "10" => O <= C;
            when "11" => O <= D;
            when others => O <= (others => '0');
        end case;
    end process;
end architecture;