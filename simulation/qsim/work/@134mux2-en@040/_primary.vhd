library verilog;
use verilog.vl_types.all;
entity \mux2-en\ is
    port(
        F               : out    vl_logic;
        E               : in     vl_logic_vector(1 downto 0);
        \~EN\           : in     vl_logic;
        S               : in     vl_logic
    );
end \mux2-en\;
