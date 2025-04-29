library IEEE;
use IEEE.STD_LOGIC;
use IEEE.NUMERIC_STD;

entity Simple_Instruction_Set is
    Port ( 
        clk         : in  STD_LOGIC;
        reset       : in  STD_LOGIC;
        opcode      : in  STD_LOGIC_VECTOR (1 downto 0);  -- 00: LOAD, 01: STORE
        addr        : in  STD_LOGIC_VECTOR (7 downto 0);
        data_in     : in  STD_LOGIC_VECTOR (15 downto 0);
        data_out    : out STD_LOGIC_VECTOR (15 downto 0);
        mem_write   : out STD_LOGIC;
        mem_read    : out STD_LOGIC
    );
end Simple_Instruction_Set;

architecture Behavioral of Simple_Instruction_Set is

    type memory_type is array (0 to 255) of STD_LOGIC_VECTOR (15 downto 0);
    signal memory : memory_type;

begin
    
