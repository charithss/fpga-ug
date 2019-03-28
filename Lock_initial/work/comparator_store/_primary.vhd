library verilog;
use verilog.vl_types.all;
entity comparator_store is
    port(
        codein          : in     vl_logic_vector(2 downto 0);
        code_no         : in     vl_logic_vector(1 downto 0);
        program         : in     vl_logic;
        compare         : out    vl_logic_vector(2 downto 0)
    );
end comparator_store;
