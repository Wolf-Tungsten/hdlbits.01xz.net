module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );

    wire [99:0] cout_array;
   
    bcd_fadd bf0(
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(cin),
        .cout(cout_array[0]),
        .sum(sum[3:0])
    );
    
    genvar i;
    generate for(i = 1; i < 100; i = i + 1) begin:bcd_fadd_gen
        bcd_fadd bf(
            .a(a[i * 4 + 3:i * 4]),
            .b(b[i * 4 + 3:i * 4]),
            .cin(cout_array[i - 1]),
            .cout(cout_array[i]),
            .sum(sum[i * 4 + 3:i * 4])
        );
    end
    endgenerate
    
    assign cout = cout_array[99];
    
endmodule
