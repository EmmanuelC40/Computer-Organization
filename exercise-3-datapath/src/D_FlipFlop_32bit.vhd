library ieee;
use ieee.std_logic_1164.all;

entity D_FlipFlop_32bit is
    Port (
        clk   : in  std_logic;
        load  : in  std_logic;
        d     : in  std_logic_vector(31 downto 0);
        q     : out std_logic_vector(31 downto 0)
    );
end entity;

architecture D_FlipFlop_32bitArch of D_FlipFlop_32bit is
    signal temp : std_logic_vector(31 downto 0);
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if load = '1' then
                temp <= d;
            end if;
        end if;
    end process;
    q <= temp;
end architecture;
