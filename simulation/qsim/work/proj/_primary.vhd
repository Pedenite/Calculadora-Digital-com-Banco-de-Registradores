library verilog;
use verilog.vl_types.all;
entity proj is
    port(
        Overflow        : out    vl_logic;
        Neg             : in     vl_logic;
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        F               : out    vl_logic_vector(7 downto 0)
    );
end proj;
