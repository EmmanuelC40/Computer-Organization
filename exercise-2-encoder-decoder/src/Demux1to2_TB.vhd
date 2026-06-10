library ieee;
use ieee.std_logic_1164.all;

entity Demux1to2_TB is
end entity Demux1to2_TB;

architecture Demux1to2_TBArch of Demux1to2_TB is
    signal D_TB : std_logic;
    signal S_TB : std_logic;
    signal Y0_TB, Y1_TB : std_logic;

    component Demux1to2 is
        port(
            D : in std_logic;
            S : in std_logic;
            Y0 : out std_logic;
            Y1 : out std_logic
        );
    end component;
begin
    DUT : Demux1to2
        port map(
            D => D_TB,
            S => S_TB,
            Y0 => Y0_TB,
            Y1 => Y1_TB
        );

    stimulus : process
    begin
        -- Expect Y0 = '0', Y1 = '0'
        D_TB <= '0'; S_TB <= '0'; wait for 10 ns;

        -- Expect Y0 = '0', Y1 = '0'
        D_TB <= '0'; S_TB <= '1'; wait for 10 ns;
		  
		  -- Expect Y0 = '1', Y1 = '0'
        D_TB <= '1'; S_TB <= '0'; wait for 10 ns;

        -- Expect Y0 = '0', Y1 = '1'
        D_TB <= '1'; S_TB <= '1'; wait for 10 ns;

        wait;
    end process;
end architecture Demux1to2_TBArch;
