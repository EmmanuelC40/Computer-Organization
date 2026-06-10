library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end entity testbench;

architecture testbenchArch of testbench is
    signal clk      : std_logic := '0';
    signal loadA    : std_logic := '0';
    signal loadB    : std_logic := '0';
    signal loadRes  : std_logic := '0';
    signal add_sub  : std_logic := '1';
    signal addrA    : std_logic_vector(7 downto 0) := x"00";
    signal addrB    : std_logic_vector(7 downto 0) := x"01";
    signal addrRes  : std_logic_vector(7 downto 0) := x"02";
    signal overflow : std_logic;

    signal regA_dbg  : std_logic_vector(31 downto 0);
    signal regB_dbg  : std_logic_vector(31 downto 0);
    signal result_dbg: std_logic_vector(31 downto 0);

begin
    clk <= not clk after 10 ns;

    DUT : entity work.toplevel
        port map(
            clk          => clk,
            loadA        => loadA,
            loadB        => loadB,
            loadRes      => loadRes,
            add_sub      => add_sub,
            addrA        => addrA,
            addrB        => addrB,
            addrRes      => addrRes,
            overflow     => overflow,
            regA_out_dbg => regA_dbg,
            regB_out_dbg => regB_dbg,
            result_dbg   => result_dbg
        );

process
begin
    wait for 20 ns;
    
    ---------------------------------------------------
    -- TEST 1: Overflow Test + ADD operation
    ---------------------------------------------------
    addrA <= x"00";
    addrB <= x"01";
    wait for 40 ns; 
    
    loadA <= '1'; 
    loadB <= '1';
    wait for 20 ns;
    loadA <= '0'; 
    loadB <= '0';
    
    add_sub <= '1';
    wait for 20 ns;
    
    addrRes <= x"02";
    loadRes <= '1';
    wait for 20 ns;
    loadRes <= '0';
    
    wait for 40 ns;
    
    ---------------------------------------------------
    -- TEST 2: SUB operation
    ---------------------------------------------------
	 
    add_sub <= '0';
    wait for 20 ns;
    
    addrRes <= x"03";
    loadRes <= '1';
    wait for 20 ns;
    loadRes <= '0';
    
    wait for 40 ns;
    
    ---------------------------------------------------
    -- TEST 3: Same Address Test
    ---------------------------------------------------
	 
    addrA <= x"01";
    addrB <= x"01";
    wait for 40 ns; 
    
    loadA <= '1'; 
    loadB <= '1';
    wait for 20 ns;
    loadA <= '0'; 
    loadB <= '0';
    
    add_sub <= '1';
    wait for 20 ns;
    
    addrRes <= x"04";
    loadRes <= '1';
    wait for 20 ns;
    loadRes <= '0';
    
    wait for 100 ns;
    
    wait;
end process;
end testbenchArch;