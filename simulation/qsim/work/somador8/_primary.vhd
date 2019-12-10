library verilog;
use verilog.vl_types.all;
entity somador8 is
    port(
        Overflow        : out    vl_logic;
        A               : in     vl_logic_vector(7 downto 0);
        Cin             : in     vl_logic;
        B               : in     vl_logic_vector(7 downto 0);
        F               : out    vl_logic_vector(7 downto 0)
    );
end somador8;
