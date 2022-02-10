module top_module( 
    input [254:0] in,
    output reg [7:0] out );

    always @(*) begin
        out = 8'b0;
        for(integer i = 0; i < $bits(in); i++) 
            out = out + in[i];
    end
endmodule