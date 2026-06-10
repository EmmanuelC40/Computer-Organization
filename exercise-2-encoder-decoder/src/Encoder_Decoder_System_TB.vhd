library ieee;
use ieee.std_logic_1164.all;

entity Encoder_Decoder_System_TB is
end entity Encoder_Decoder_System_TB;

architecture Encoder_Decoder_System_TBArch of Encoder_Decoder_System_TB is
    signal D7_TB, D6_TB, D5_TB, D4_TB, D3_TB, D2_TB, D1_TB, D0_TB : std_logic;

    signal Enc2_TB, Enc1_TB, Enc0_TB : std_logic;

    signal valid_TB : std_logic;

    signal Y7_TB, Y6_TB, Y5_TB, Y4_TB, Y3_TB, Y2_TB, Y1_TB, Y0_TB : std_logic;

    component Priority_Encoder8to3 is
        port(
            D7 : in std_logic;
            D6 : in std_logic;
            D5 : in std_logic;
            D4 : in std_logic;
            D3 : in std_logic;
            D2 : in std_logic;
            D1 : in std_logic;
            D0 : in std_logic;
            Y2 : out std_logic;
            Y1 : out std_logic;
            Y0 : out std_logic;
            valid : out std_logic
        );
    end component;

    component Decoder3to8 is
        port(
            A2 : in std_logic;
            A1 : in std_logic;
            A0 : in std_logic;
            Y7 : out std_logic;
            Y6 : out std_logic;
            Y5 : out std_logic;
            Y4 : out std_logic;
            Y3 : out std_logic;
            Y2 : out std_logic;
            Y1 : out std_logic;
            Y0 : out std_logic
        );
    end component;
begin
    -- Encoder output drives Decoder input
    U1 : Priority_Encoder8to3
        port map(
            D7 => D7_TB, D6 => D6_TB, D5 => D5_TB, D4 => D4_TB,
            D3 => D3_TB, D2 => D2_TB, D1 => D1_TB, D0 => D0_TB,
            Y2 => Enc2_TB, Y1 => Enc1_TB, Y0 => Enc0_TB,
            valid => valid_TB
        );

    U2 : Decoder3to8
        port map(
            A2 => Enc2_TB, A1 => Enc1_TB, A0 => Enc0_TB,
            Y7 => Y7_TB, Y6 => Y6_TB, Y5 => Y5_TB, Y4 => Y4_TB,
            Y3 => Y3_TB, Y2 => Y2_TB, Y1 => Y1_TB, Y0 => Y0_TB
        );

    stimulus : process
    begin
        -- D_in = "00000001" => Expect Dec_out="00000001", valid='1'
        D7_TB <= '0'; D6_TB <= '0'; D5_TB <= '0'; D4_TB <= '0';
        D3_TB <= '0'; D2_TB <= '0'; D1_TB <= '0'; D0_TB <= '1';
        wait for 10 ns;

        -- D_in = "00010000" => Expect Dec_out="00010000", valid='1'
        D0_TB <= '0'; D4_TB <= '1'; wait for 10 ns;

        -- D_in = "01000000" => Expect Dec_out="01000000", valid='1'
        D4_TB <= '0'; D6_TB <= '1'; wait for 10 ns;

        -- D_in = "10000000" => Expect Dec_out="10000000", valid='1'
        D6_TB <= '0'; D7_TB <= '1'; wait for 10 ns;

        -- D_in = "00000000" => Expect Dec_out="00000000", valid='0'
        D7_TB <= '0'; wait for 10 ns;

        wait;
    end process;
end architecture Encoder_Decoder_System_TBArch;
