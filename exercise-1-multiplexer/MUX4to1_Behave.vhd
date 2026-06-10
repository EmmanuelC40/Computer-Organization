library ieee;
use ieee.std_logic_1164.all;

entity MUX4to1_Behave is
    port(
        A, B, C, D : in std_logic;
        S          : in std_logic_vector(1 downto 0);
        O          : out std_logic
    );
end entity;

architecture MUX4to1_BehaveArch of MUX4to1_Behave is
begin
    process(S, A, B, C, D)
    begin
        case S is
            when "00" => O <= A;
            when "01" => O <= B;
            when "10" => O <= C;
            when "11" => O <= D;
            when others => O <= '0';
        end case;
    end process;
end architecture;
