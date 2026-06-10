library ieee;
use ieee.std_logic_1164.all;

entity MUX4to1_Struct is
    port(
        A, B, C, D : in std_logic;
        S          : in std_logic_vector(1 downto 0);
        O          : out std_logic
    );
end entity;

architecture MUX4to1_StructArch of MUX4to1_Struct is
    component MUX2to1
        port(
            A, B, S : in std_logic;
            O       : out std_logic
        );
    end component;

    signal mux_out1, mux_out2 : std_logic;
begin
    U1 : MUX2to1 port map(A => A, B => B, S => S(0), O => mux_out1);
    U2 : MUX2to1 port map(A => C, B => D, S => S(0), O => mux_out2);
    U3 : MUX2to1 port map(A => mux_out1, B => mux_out2, S => S(1), O => O);
end architecture;
