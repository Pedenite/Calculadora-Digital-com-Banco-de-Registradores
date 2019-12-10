library verilog;
use verilog.vl_types.all;
entity \Bin-BCD\ is
    port(
        Da              : out    vl_logic_vector(3 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        Db              : out    vl_logic_vector(3 downto 0);
        Dc              : out    vl_logic_vector(1 downto 0)
    );
end \Bin-BCD\;
