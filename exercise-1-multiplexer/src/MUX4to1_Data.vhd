library ieee;
use ieee.std_logic_1164.all;

entity MUX4to1_Data is
    port(
        A, B, C, D : in std_logic;
        S          : in std_logic_vector(1 downto 0);
        O          : out std_logic
    );
end entity;

architecture MUX4to1_DataArch of MUX4to1_Data is
begin
    O <= ((not S(1) and not S(0)) and A) or
         ((not S(1) and     S(0)) and B) or
         ((    S(1) and not S(0)) and C) or
         ((    S(1) and     S(0)) and D);
end architecture;
