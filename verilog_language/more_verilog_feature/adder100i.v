module full_adder (
    input a, b, cin,
    output sum, cout
);
    assign sum = (a & !b & !cin) | (!a & b & !cin) | (!a & !b & cin) | (a & b & cin);
    assign cout = (a & b & cin) | (a & b & !cin) | (a & !b & cin) | (!a & b & cin);
endmodule

module top_module( 
    input [99:0] a, b,
    input cin,
    output reg [99:0] cout,
    output reg [99:0] sum );

    full_adder fa0(.a(a[0]), .b(b[0]), .cin(cin), .cout(cout[0]), .sum(sum[0]));
    genvar i;
    generate for(i = 1; i < $bits(a); i = i + 1) begin:fa
        full_adder fa(
            .a(a[i]),
            .b(b[i]),
            .cin(cout[i - 1]),
            .cout(cout[i]),
            .sum(sum[i])
        );
    	end
    endgenerate
endmodule