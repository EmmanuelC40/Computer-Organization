library ieee;
use ieee.std_logic_1164.all;

entity MUX4to1_Data_TB is
end entity MUX4to1_Data_TB;

architecture MUX4to1_Data_TBArch of MUX4to1_Data_TB is
    signal a_TB, b_TB, c_TB, d_TB, o_TB : std_logic;
    signal s_TB : std_logic_vector(1 downto 0);

    component MUX4to1_Data is
        port(
            A, B, C, D : in std_logic;
            S          : in std_logic_vector(1 downto 0);
            O          : out std_logic
        );
    end component;
begin
    DUT : MUX4to1_Data
        port map(A => a_TB, B => b_TB, C => c_TB, D => d_TB, S => s_TB, O => o_TB);

    stimulus : process
    begin
        a_TB <= '0'; b_TB <= '1'; c_TB <= '0'; d_TB <= '1';

        s_TB <= "00"; wait for 10 ns; -- Expect A
        s_TB <= "01"; wait for 10 ns; -- Expect B
        s_TB <= "10"; wait for 10 ns; -- Expect C
        s_TB <= "11"; wait for 10 ns; -- Expect D

        wait;
    end process;
end architecture MUX4to1_Data_TBArch;
