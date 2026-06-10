library ieee;
use ieee.std_logic_1164.all;

entity Priority_Encoder8to3 is
    Port (
        D0, D1, D2, D3, D4, D5, D6, D7 : in std_logic;
        Y2, Y1, Y0 : out std_logic;
        valid : out std_logic
    );
end entity;

architecture Priority_Encoder8to3Arch of Priority_Encoder8to3 is
begin
    process(D0, D1, D2, D3, D4, D5, D6, D7)
    begin
        Y2 <= '0';
        Y1 <= '0';
        Y0 <= '0';
        valid <= '0';

        if D7 = '1' then
				Y2 <= '1'; Y1 <= '1'; Y0 <= '1';
            valid <= '1';
        elsif D6 = '1' then
            Y2 <= '1'; Y1 <= '1'; Y0 <= '0';
            valid <= '1';
        elsif D5 = '1' then
            Y2 <= '1'; Y1 <= '0'; Y0 <= '1';
            valid <= '1';
        elsif D4 = '1' then
            Y2 <= '1'; Y1 <= '0'; Y0 <= '0';
            valid <= '1';
        elsif D3 = '1' then
            Y2 <= '0'; Y1 <= '1'; Y0 <= '1';
            valid <= '1';
        elsif D2 = '1' then
            Y2 <= '0'; Y1 <= '1'; Y0 <= '0';
            valid <= '1';
        elsif D1 = '1' then
            Y2 <= '0'; Y1 <= '0'; Y0 <= '1';
            valid <= '1';
        elsif D0 = '1' then
            Y2 <= '0'; Y1 <= '0'; Y0 <= '0';
            valid <= '1';
        end if;
    end process;
end architecture;
