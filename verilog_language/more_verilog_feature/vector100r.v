module top_module( 
    input [99:0] in,
    output [99:0] out
);
    reg [99:0] _out;
    always @(*) begin
        for( integer i = 0; i < $bits(in); i = i + 1) begin
            _out[i] = in[$bits(in) - i - 1];
        end
    end
    assign out = _out;

endmodule