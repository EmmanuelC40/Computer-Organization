library ieee;
use ieee.std_logic_1164.all;

entity Priority_Encoder8to3_TB is
end entity Priority_Encoder8to3_TB;

architecture Priority_Encoder8to3_TBArch of Priority_Encoder8to3_TB is
    signal D7_TB, D6_TB, D5_TB, D4_TB, D3_TB, D2_TB, D1_TB, D0_TB : std_logic;
    signal Y2_TB, Y1_TB, Y0_TB : std_logic;
    signal valid_TB : std_logic;

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
begin
    DUT : Priority_Encoder8to3
        port map(
            D7 => D7_TB,
            D6 => D6_TB,
            D5 => D5_TB,
            D4 => D4_TB,
            D3 => D3_TB,
            D2 => D2_TB,
            D1 => D1_TB,
            D0 => D0_TB,
            Y2 => Y2_TB,
            Y1 => Y1_TB,
            Y0 => Y0_TB,
            valid => valid_TB
        );

    stimulus : process
    begin
        -- All inputs '0' => expect Y="000", valid='0'
        D7_TB <= '0'; D6_TB <= '0'; D5_TB <= '0'; D4_TB <= '0';
        D3_TB <= '0'; D2_TB <= '0'; D1_TB <= '0'; D0_TB <= '0'; 
		  wait for 10 ns;

        -- Only D0 high => expect Y="000", valid='1'
        D0_TB <= '1'; wait for 10 ns;

        -- Only D2 high => expect Y="010"
        D0_TB <= '0'; D2_TB <= '1'; wait for 10 ns;

        -- Only D5 high => expect Y="101"
        D2_TB <= '0'; D5_TB <= '1'; wait for 10 ns;

        -- All inputs high => expect Y="111" (highest priority)
        D0_TB <= '1'; D1_TB <= '1'; D2_TB <= '1'; D3_TB <= '1';
        D4_TB <= '1'; D5_TB <= '1'; D6_TB <= '1'; D7_TB <= '1'; 
		  wait for 10 ns;

        wait;
    end process;
end architecture Priority_Encoder8to3_TBArch;
