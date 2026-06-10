library ieee;
use ieee.std_logic_1164.all;

entity MUX2to1 is
	port(
		A, B, S : in std_logic;
		O       : out std_logic
	);
end entity MUX2to1;

architecture MUX2to1Arch of MUX2to1 is
	begin
		O <= ((NOT S) AND A) OR (S AND B);
end architecture MUX2to1Arch;
