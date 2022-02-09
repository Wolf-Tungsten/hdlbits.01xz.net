module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    
    wire [31:0] xor_b = b ^ {32{sub}};
    wire lcout;
    wire [15:0] lsum;
    wire [15:0] hsum;
    
    add16 ladd16(
        .a(a[15:0]),
        .b(xor_b[15:0]),
        .cin(sub),
        .cout(lcout),
        .sum(lsum)
    );
    
    add16 hadd16(
        .a(a[31:16]),
        .b(xor_b[31:16]),
        .cin(lcout),
        .sum(hsum)
    );
    
    assign sum = {hsum, lsum};

endmodule
