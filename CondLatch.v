`timescale 1ns / 1ps


module CondLatch(
	input clk,
	input [31:0] IN,
	input WE,
	output reg [31:0] OUT
    );
	 
initial begin

assign OUT = 32'b0;

end

reg [31:0] temp;

assign OUT = temp;

always @(posedge clk) begin 

	if (WE) temp <= IN;
	
end

endmodule
