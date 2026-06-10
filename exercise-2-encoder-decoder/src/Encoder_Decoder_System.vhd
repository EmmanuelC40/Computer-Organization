library ieee;
use ieee.std_logic_1164.all;

entity Encoder_Decoder_System is
    Port (
        D_in0 : in std_logic;
        D_in1 : in std_logic;
        D_in2 : in std_logic;
        D_in3 : in std_logic;
        D_in4 : in std_logic;
        D_in5 : in std_logic;
        D_in6 : in std_logic;
        D_in7 : in std_logic;
        
        D_out0 : out std_logic;
        D_out1 : out std_logic;
        D_out2 : out std_logic;
        D_out3 : out std_logic;
        D_out4 : out std_logic;
        D_out5 : out std_logic;
        D_out6 : out std_logic;
        D_out7 : out std_logic
    );
end entity;

architecture Encoder_Decoder_SystemArch of Encoder_Decoder_System is
    signal encoded0 : std_logic;
    signal encoded1 : std_logic;
    signal encoded2 : std_logic;
    signal valid : std_logic;

    component Priority_Encoder8to3
        Port ( 
            D0 : in std_logic;
            D1 : in std_logic;
            D2 : in std_logic;
            D3 : in std_logic;
            D4 : in std_logic;
            D5 : in std_logic;
            D6 : in std_logic;
            D7 : in std_logic;
            
            Y0 : out std_logic;
            Y1 : out std_logic;
            Y2 : out std_logic;
            
            valid : out std_logic 
        );
    end component;

    component Decoder3to8
        Port ( 
            A0 : in std_logic;
            A1 : in std_logic;
            A2 : in std_logic;
            
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
    ENC: Priority_Encoder8to3 
        port map(
            D0 => D_in0,
            D1 => D_in1,
            D2 => D_in2,
            D3 => D_in3,
            D4 => D_in4,
            D5 => D_in5,
            D6 => D_in6,
            D7 => D_in7,
            
            Y0 => encoded0,
            Y1 => encoded1,
            Y2 => encoded2,
            
            valid => valid
        );

    DEC: Decoder3to8 
        port map(
            A0 => encoded0,
            A1 => encoded1,
            A2 => encoded2,
            
            Y0 => D_out0,
            Y1 => D_out1,
            Y2 => D_out2,
            Y3 => D_out3,
            Y4 => D_out4,
            Y5 => D_out5,
            Y6 => D_out6,
            Y7 => D_out7
        );
end architecture;

