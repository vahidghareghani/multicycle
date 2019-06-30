`timescale 1ns / 1ps

module ControlUnit(
	input 				clock;
	input   		[5:0] OpCode;
	input   		[5:0] Function;
	output reg	[1:0] ALUOp;
	output reg			MemToReg;
	output reg 			RegDes;
	output reg 			IorD;
	output reg			PcSrc;
	output reg	[1:0] ALUSrcB;
	output reg			ALUSrcA;
	output reg 			IRWrite;
	output reg 			MemWrite;
	output reg 			PcWrite;
	output reg 			Branch;
	output reg 			RegWrite;
	output reg  [2:0]	ALUControl;
    );
	
	reg [3:0] state;
	
	initial 
	begin
			state = 0;
	end
	
	always @(posedge clock) 
	begin
		case (state)
			
			0:
			begin
				IorD 			<= 0 ;
				ALUSrcA 		<= 0 ;
				ALUSrcB		<= 01;
				AlUOp			<=	00;
				PcSrc			<= 0 ;
				
			end
				
			1:
			begin
			
			end
			
			2:
			begin
			
			end
			
			3:
			begin
			
			end
			
			4:
			begin
			
			end
			
			5:
			begin
			
			end
			
			6:
			begin
			
			end
			
			7:
			begin
			
			end
			
			8:
			begin
			
			end
			
			9:
			begin
			
			end
			
			10:
			begin
			
			end
				
		

endmodule
