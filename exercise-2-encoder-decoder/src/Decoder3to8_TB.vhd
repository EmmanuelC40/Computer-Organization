library ieee;
use ieee.std_logic_1164.all;

entity Decoder3to8_TB is
end entity Decoder3to8_TB;

architecture Decoder3to8_TBArch of Decoder3to8_TB is
    signal a2_TB, a1_TB, a0_TB : std_logic;
    signal y0_TB, y1_TB, y2_TB, y3_TB, y4_TB, y5_TB, y6_TB, y7_TB : std_logic;

    component Decoder3to8 is
        port(
            A2 : in std_logic;
            A1 : in std_logic;
            A0 : in std_logic;
            Y0 : out std_logic;
            Y1 : out std_logic;
            Y2 : out std_logic;
            Y3 : out std_logic;
            Y4 : out std_logic;
            Y5 : out std_logic;
            Y6 : out std_logic;
            Y7 : out std_logic
        );
    end component;
begin
    DUT : Decoder3to8
        port map(
            A2 => a2_TB,
            A1 => a1_TB,
            A0 => a0_TB,
            Y0 => y0_TB,
            Y1 => y1_TB,
            Y2 => y2_TB,
            Y3 => y3_TB,
            Y4 => y4_TB,
            Y5 => y5_TB,
            Y6 => y6_TB,
            Y7 => y7_TB
        );

    stimulus : process
    begin
        a2_TB <= '0'; a1_TB <= '0'; a0_TB <= '0'; 
				wait for 10 ns; -- Expect Y0 = '1'
				
        a2_TB <= '0'; a1_TB <= '0'; a0_TB <= '1'; 
				wait for 10 ns; -- Expect Y1 = '1'
				
        a2_TB <= '0'; a1_TB <= '1'; a0_TB <= '0'; 
				wait for 10 ns; -- Expect Y2 = '1'
				
        a2_TB <= '0'; a1_TB <= '1'; a0_TB <= '1'; 
				wait for 10 ns; -- Expect Y3 = '1'
				
        a2_TB <= '1'; a1_TB <= '0'; a0_TB <= '0'; 
				wait for 10 ns; -- Expect Y4 = '1'
				
        a2_TB <= '1'; a1_TB <= '0'; a0_TB <= '1'; 
				wait for 10 ns; -- Expect Y5 = '1'
				
        a2_TB <= '1'; a1_TB <= '1'; a0_TB <= '0';
				wait for 10 ns; -- Expect Y6 = '1'
				
        a2_TB <= '1'; a1_TB <= '1'; a0_TB <= '1'; 
				wait for 10 ns; -- Expect Y7 = '1'
        wait;
    end process;
end architecture Decoder3to8_TBArch;
