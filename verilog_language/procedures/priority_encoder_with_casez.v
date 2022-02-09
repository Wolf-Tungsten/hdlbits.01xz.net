// synthesis verilog_input_version verilog_2001
module top_module (
    input [7:0] in,
    output reg [2:0] pos  );
	
    always @(*) begin
        casez(in)
            8'bzzzz_zzz1: pos = 3'h0;
            8'bzzzz_zz10: pos = 3'h1;
            8'bzzzz_z100: pos = 3'h2;
            8'bzzzz_1000: pos = 3'h3;
            8'bzzz1_0000: pos = 3'h4;
            8'bzz10_0000: pos = 3'h5;
            8'bz100_0000: pos = 3'h6;
            8'b1000_0000: pos = 3'h7;
            default: pos = 3'h0;
        endcase
    end
endmodule