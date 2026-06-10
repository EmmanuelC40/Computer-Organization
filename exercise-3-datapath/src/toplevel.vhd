library ieee;
use ieee.std_logic_1164.all;

entity toplevel is
    port(
        clk       : in  std_logic;
        loadA     : in  std_logic;
        loadB     : in  std_logic;
        loadRes   : in  std_logic;
        add_sub   : in  std_logic;
        addrA     : in  std_logic_vector(7 downto 0);
        addrB     : in  std_logic_vector(7 downto 0);
        addrRes   : in  std_logic_vector(7 downto 0);
        overflow  : out std_logic;

        -- debug outputs
        regA_out_dbg  : out std_logic_vector(31 downto 0);
        regB_out_dbg  : out std_logic_vector(31 downto 0);
        result_dbg    : out std_logic_vector(31 downto 0)
    );
end entity;

architecture toplevelarch of toplevel is

    -- SRAM outputs
    signal sram_outA : std_logic_vector(31 downto 0);
    signal sram_outB : std_logic_vector(31 downto 0);
    
    -- Register outputs
    signal regA_out  : std_logic_vector(31 downto 0);
    signal regB_out  : std_logic_vector(31 downto 0);
    
    -- ADD/SUB output
    signal alu_result : std_logic_vector(31 downto 0);
    
    -- Output of the DFF result register
    signal result_reg : std_logic_vector(31 downto 0);
    
begin
    
    -------------------------------------------------------
    -- READ Operands from SRAM
    -------------------------------------------------------
    RAM_A : entity work.sram_1port
        port map (
            address => addrA,
            clock   => clk,
            data    => (others=>'0'),
            wren    => '0',
            q       => sram_outA
        );
        
    RAM_B : entity work.sram_1port
        port map (
            address => addrB,
            clock   => clk,
            data    => (others=>'0'),
            wren    => '0',
            q       => sram_outB
        );
    
    -------------------------------------------------------
    -- OPERAND REGISTERS
    -------------------------------------------------------
    RA : entity work.shiftreg
        port map (
            clock => clk,
				enable => loadA,
            load  => '1',
            data  => sram_outA,
            q     => regA_out
        );
        
    RB : entity work.shiftreg
        port map (
            clock => clk,
				enable => loadB,
            load  => '1',
            data  => sram_outB,
            q     => regB_out
        );
    
    -------------------------------------------------------
    -- ADDER / SUBTRACTOR UNIT
    -------------------------------------------------------
    U_ADD : entity work.add_sub_32bit
        port map (
            dataa    => regA_out,
            datab    => regB_out,
            add_sub  => add_sub,
            result   => alu_result,
            overflow => overflow
        );
    
    -------------------------------------------------------
    -- RESULT REGISTER
    -------------------------------------------------------
    U_REG : entity work.D_FlipFlop_32bit
        port map (
            clk  => clk,
            load => loadRes,
            d    => alu_result,
            q    => result_reg
        );
    
    -------------------------------------------------------
    -- WRITE BACK TO SRAM
    -------------------------------------------------------
    RAM_RES : entity work.sram_1port
        port map (
            address => addrRes,
            clock   => clk,
            data    => result_reg,
            wren    => loadRes,
            q       => open
        );
    
    -------------------------------------------------------
    -- DEBUG OUTPUTS
    -------------------------------------------------------
    regA_out_dbg <= regA_out;
    regB_out_dbg <= regB_out;
    result_dbg   <= result_reg;
    
end architecture;