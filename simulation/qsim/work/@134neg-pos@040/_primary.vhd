library verilog;
use verilog.vl_types.all;
entity \neg-pos\ is
    port(
        Saida           : out    vl_logic_vector(7 downto 0);
        Entrada         : in     vl_logic_vector(7 downto 0)
    );
end \neg-pos\;
