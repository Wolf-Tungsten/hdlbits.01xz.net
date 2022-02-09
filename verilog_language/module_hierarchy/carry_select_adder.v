module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] hsum_cin0;
    wire [15:0] hsum_cin1;
    wire 		lcout;
    wire [15:0] lsum;
    
    add16 ladd16 (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .cout(lcout),
        .sum(lsum)
    );
    
    add16 hadd16_cin0 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b0),
        .sum(hsum_cin0),
    );
    
    add16 hadd16_cin1 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b1),
        .sum(hsum_cin1),
    );
    
    assign sum = {(lcout ? hsum_cin1 : hsum_cin0), lsum};    

endmodule