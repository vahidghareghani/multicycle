`timescale 1ns / 1ps


module MUX_2__32(
	input [31:0] O,
	input [31:0] I,
	input  Sel,
	output [31:0] OUT
    );
	 
always @(O or I or Sel) begin
	case(Sel)
		
		1'b0: OUT <= O;
		
		1'b1: OUT <= I;
			
	endcase
end
endmodule
