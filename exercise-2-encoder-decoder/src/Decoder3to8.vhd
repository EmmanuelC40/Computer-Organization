library ieee;
use ieee.std_logic_1164.all;

entity Decoder3to8 is
    Port (
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
end entity;

architecture Decoder3to8Arch of Decoder3to8 is
begin
    process(A2, A1, A0)
			variable A_vec : std_logic_vector(2 downto 0);
    begin
		  A_vec := A2 & A1 & A0;
		  
        Y0 <= '0';
        Y1 <= '0';
        Y2 <= '0';
        Y3 <= '0';
        Y4 <= '0';
        Y5 <= '0';
        Y6 <= '0';
        Y7 <= '0';

        case A_vec is
            when "000" => Y0 <= '1';
            when "001" => Y1 <= '1';
            when "010" => Y2 <= '1';
            when "011" => Y3 <= '1';
            when "100" => Y4 <= '1';
            when "101" => Y5 <= '1';
            when "110" => Y6 <= '1';
            when "111" => Y7 <= '1';
            when others => null;
        end case;
    end process;
end architecture;
