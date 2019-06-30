`timescale 1ns / 1ps


module Latch(
	input clk,
	input [31:0] IN,
	output reg [31:0] OUT
    );
	
	reg [31:0] temp;
	
	assign OUT = temp;
	
always @(posedge clk) begin

	temp <= IN;
	
end 

endmodule
