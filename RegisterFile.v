`timescale 1ns / 1ps



module RegisterFile(
	input clk,
	input [4:0] A1,
	input [4:0] A2,
	input [4:0] A3,
	input [31:0] WD3,
	input WE3,
	output reg [31:0] RD1,
	output reg [31:0] RD2
    );

integer i;

reg [31:0] registers [0:31];

initial 

	begin
	
		register[0] = 0;
		
		for(i=1;i<32;i=i+1)register[i] = 0;
		
	end
	
	
always @(negedge clk)

	begin
		RD1 <= register[A1];
		RD2 <= register[A2];
	end
	
always @(posedge clk)

	begin
	
		if(WE3) begin
		
			$display("Data to write : %d",WD3);
			register[A3] <= WD3;
			
		end
		
	end
	
endmodule
