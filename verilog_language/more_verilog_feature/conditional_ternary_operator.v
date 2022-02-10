module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    // assign intermediate_result1 = compare? true: false;
    wire [7:0] intm1, intm2;
	assign intm1 = a < b ? a : b;
    assign intm2 = intm1 < c ? intm1 : c;
    assign min = intm2 < d ? intm2 : d;
endmodule