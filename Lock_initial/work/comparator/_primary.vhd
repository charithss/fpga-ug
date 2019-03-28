library verilog;
use verilog.vl_types.all;
entity comparator is
    port(
        codein          : in     vl_logic_vector(2 downto 0);
        coderetrive     : in     vl_logic_vector(2 downto 0);
        compare         : out    vl_logic
    );
end comparator;
