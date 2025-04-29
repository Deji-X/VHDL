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

    process(clk, reset)
    begin
        if reset = '1' then
            -- Initialize memory
            for i in 0 to 255 loop
                memory(i) <= (others => '0');
            end loop;
            mem_write <= '0';
            mem_read <= '0';
        elsif rising_edge(clk) then
            case opcode is
                when "00" => -- LOAD instruction
                    data_out <= memory(to_integer(unsigned(addr)));
                    mem_read <= '1';
                    mem_write <= '0';
                when "01" => -- STORE instruction
                    memory(to_integer(unsigned(addr))) <= data_in;
                    mem_write <= '1';
                    mem_read <= '0';
                when others =>
                    mem_write <= '0';
                    mem_read <= '0';
            end case;
        end if;
    end process;

end Behavioral;
