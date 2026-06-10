library ieee;
use ieee.std_logic_1164.all;

entity MUX4to1_8bit_TB is
end entity MUX4to1_8bit_TB;

architecture MUX4to1_8bit_TBArch of MUX4to1_8bit_TB is
    signal a_TB, b_TB, c_TB, d_TB, o_TB : std_logic_vector(7 downto 0);
    signal s_TB : std_logic_vector(1 downto 0);

    component MUX4to1_8bit is
        port(
            A, B, C, D : in std_logic_vector(7 downto 0);
            S          : in std_logic_vector(1 downto 0);
            O          : out std_logic_vector(7 downto 0)
        );
    end component;
begin
    DUT : MUX4to1_8bit
        port map(A => a_TB, B => b_TB, C => c_TB, D => d_TB, S => s_TB, O => o_TB);

    stimulus : process
    begin
        a_TB <= "11110000";
        b_TB <= "00001111";
        c_TB <= "10101010";
        d_TB <= "01010101";

        s_TB <= "00"; wait for 10 ns; -- Expect A
        s_TB <= "01"; wait for 10 ns; -- Expect B
        s_TB <= "10"; wait for 10 ns; -- Expect C
        s_TB <= "11"; wait for 10 ns; -- Expect D

        wait;
    end process;
end architecture MUX4to1_8bit_TBArch;
