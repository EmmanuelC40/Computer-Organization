library ieee;
use ieee.std_logic_1164.all;

entity Demux1to2 is
    Port (
        D : in std_logic;
        S : in std_logic;
        Y0 : out std_logic;
        Y1 : out std_logic
    );
end entity;

architecture Demux1to2Arch of Demux1to2 is
begin
    process(D, S)
    begin
        if S = '0' then
            Y0 <= D;
            Y1 <= '0';
        else
            Y0 <= '0';
            Y1 <= D;
        end if;
    end process;
end architecture;

