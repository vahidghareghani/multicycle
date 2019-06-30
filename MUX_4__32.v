`timescale 1ns / 1ps


module MUX_4__32(
	input [31:0] OO,
	input [31:0] OI,
	input [31:0] IO,
	input [31:0] II,
	input [1:0] Sel,
	output [31:0] OUT
    );
always @(OO or OI or IO or II or Sel) begin
	case(Sel)
		
		2'b00: OUT <= OO;
		
		2'b01: OUT <= OI;
		
		2'b10: OUT <= IO;
		
		2'b11: OUT <= II;
		
	
	endcase
end
endmodule
