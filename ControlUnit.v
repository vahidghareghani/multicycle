`timescale 1ns / 1ps

module ControlUnit(
	input 				CLK,
	input   		[5:0] OpCode,
	input   		[5:0] Function,
	output reg			MemToReg,
	output reg 			RegDes,
	output reg 			IorD,
	output reg			PcSrc,
	output reg	[1:0] ALUSrcB,
	output reg			ALUSrcA,
	output reg 			IRWrite,
	output reg 			MemWrite,
	output reg 			PcWrite,
	output reg 			Branch,
	output reg 			RegWrite,
	output reg  [2:0]	ALUControl
    );
	
	reg  [3:0] state;
	reg  [1:0] ALUOp;
	initial 
	begin
			state = 0;
	end
	
	always @(posedge CLK) 
	begin
		case (state)
			
			4'b0000:
			begin
			
				MemToReg		<= 0	   ;
				RegDes		<= 0 	   ;
				IorD 			<= 0     ;
				PcSrc			<= 0     ;
				ALUSrcB		<= 2'b00 ;
				ALUSrcA 		<= 0     ;
				IRWrite		<= 0     ;
				MemWrite		<= 0     ;
				PcWrite		<= 0     ;
				Branch		<= 0     ;
				RegWrite		<= 0     ;
				ALUControl	<= 3'b000;
				ALUOp			<=	2'b00 ;
				
				state 		<= 4'b0001;
				
			end
				
			4'b0001:
			begin
			
				MemToReg		<= 0	   ;
				RegDes		<= 0 	   ;
				IorD 			<= 0     ;
				PcSrc			<= 0     ;
				ALUSrcB		<= 2'b00 ;
				ALUSrcA 		<= 0     ;
				IRWrite		<= 0     ;
				MemWrite		<= 0     ;
				PcWrite		<= 0     ;
				Branch		<= 0     ;
				RegWrite		<= 0     ;
				ALUControl	<= 3'b000;
				ALUOp			<=	2'b00 ;
				
				case (OpCode)
				
					6'b000000:
					begin
						state <= 4'b0010;
					end
					
					6'b000000:
					begin
						state <= 4'b0110;
					end
					
					6'b000000:
					begin
						state <= 4'b1000;
					end
					
					6'b000000:
					begin
						state <= 4'b1001;
					end
					
					6'b000000:
					begin
						state <= 4'b1011;
					end
					
				endcase
				
			end
			
			4'b0010:
			begin
			
				MemToReg		<= 0	   ;
				RegDes		<= 0 	   ;
				IorD 			<= 0     ;
				PcSrc			<= 0     ;
				ALUSrcB		<= 2'b00 ;
				ALUSrcA 		<= 0     ;
				IRWrite		<= 0     ;
				MemWrite		<= 0     ;
				PcWrite		<= 0     ;
				Branch		<= 0     ;
				RegWrite		<= 0     ;
				ALUControl	<= 3'b000;
				ALUOp			<= 2'b00 ;
				
				case(OpCode)
				
					6'b000000:
					begin
						state <= 4'b0011;
					end
					
					6'b000000:
					begin
						state <= 4'b0101;
					end
					
				endcase
				
			end
			
			4'b0011:
			begin
			
				MemToReg		<= 0	   ;
				RegDes		<= 0 	   ;
				IorD 			<= 0     ;
				PcSrc			<= 0     ;
				ALUSrcB		<= 2'b00 ;
				ALUSrcA 		<= 0     ;
				IRWrite		<= 0     ;
				MemWrite		<= 0     ;
				PcWrite		<= 0     ;
				Branch		<= 0     ;
				RegWrite		<= 0     ;
				ALUControl	<= 3'b000;
				ALUOp			<=	2'b00 ;
				
				state 		<= 4'b0100;
				
			end
			
			4'b0100:
			begin
			
				ALUOp			<= 2'b00 ;
				MemToReg		<= 0	   ;
				RegDes		<= 0 	   ;
				IorD 			<= 0     ;
				PcSrc			<= 0     ;
				ALUSrcB		<= 2'b00 ;
				ALUSrcA 		<= 0     ;
				IRWrite		<= 0     ;
				MemWrite		<= 0     ;
				PcWrite		<= 0     ;
				Branch		<= 0     ;
				RegWrite		<= 0     ;
				ALUControl	<= 3'b000;
				ALUOp			<=	2'b00 ;
				
				state 		<= 4'b0000;
				
			end
			
			4'b0101:
			begin
			
				ALUOp			<= 2'b00 ;
				MemToReg		<= 0	   ;
				RegDes		<= 0 	   ;
				IorD 			<= 0     ;
				PcSrc			<= 0     ;
				ALUSrcB		<= 2'b00 ;
				ALUSrcA 		<= 0     ;
				IRWrite		<= 0     ;
				MemWrite		<= 0     ;
				PcWrite		<= 0     ;
				Branch		<= 0     ;
				RegWrite		<= 0     ;
				ALUControl	<= 3'b000;
				ALUOp			<=	2'b00 ;
				
				state 		<= 4'b0000;
				
			end
			
			4'b0110:
			begin
			
				MemToReg		<= 0	   ;
				RegDes		<= 0 	   ;
				IorD 			<= 0     ;
				PcSrc			<= 0     ;
				ALUSrcB		<= 2'b00 ;
				ALUSrcA 		<= 0     ;
				IRWrite		<= 0     ;
				MemWrite		<= 0     ;
				PcWrite		<= 0     ;
				Branch		<= 0     ;
				RegWrite		<= 0     ;
				ALUControl	<= 3'b000;
				ALUOp			<=	2'b00 ;
				
				state 		<= 4'b0111;
				
			end
			
			4'b0111:
			begin
			
				MemToReg		<= 0	   ;
				RegDes		<= 0 	   ;
				IorD 			<= 0     ;
				PcSrc			<= 0     ;
				ALUSrcB		<= 2'b00 ;
				ALUSrcA 		<= 0     ;
				IRWrite		<= 0     ;
				MemWrite		<= 0     ;
				PcWrite		<= 0     ;
				Branch		<= 0     ;
				RegWrite		<= 0     ;
				ALUControl	<= 3'b000;
				ALUOp			<=	2'b00 ;
				
				state 		<= 4'b0000;
				
			end
			
			4'b1000:
			begin
			
				MemToReg		<= 0	   ;
				RegDes		<= 0 	   ;
				IorD 			<= 0     ;
				PcSrc			<= 0     ;
				ALUSrcB		<= 2'b00 ;
				ALUSrcA 		<= 0     ;
				IRWrite		<= 0     ;
				MemWrite		<= 0     ;
				PcWrite		<= 0     ;
				Branch		<= 0     ;
				RegWrite		<= 0     ;
				ALUControl	<= 3'b000;
				ALUOp			<=	2'b00 ;
				
				state 		<= 4'b0000;
				
			end
			
			4'b1001:
			begin
			
				MemToReg		<= 0	   ;
				RegDes		<= 0 	   ;
				IorD 			<= 0     ;
				PcSrc			<= 0     ;
				ALUSrcB		<= 2'b00 ;
				ALUSrcA 		<= 0     ;
				IRWrite		<= 0     ;
				MemWrite		<= 0     ;
				PcWrite		<= 0     ;
				Branch		<= 0     ;
				RegWrite		<= 0     ;
				ALUControl	<= 3'b000;
				ALUOp			<=	2'b00 ;
				
				state 		<= 4'b1010;
				
			end
			
			4'b1010:
			begin
			
				MemToReg		<= 0	   ;
				RegDes		<= 0 	   ;
				IorD 			<= 0     ;
				PcSrc			<= 0     ;
				ALUSrcB		<= 2'b00 ;
				ALUSrcA 		<= 0     ;
				IRWrite		<= 0     ;
				MemWrite		<= 0     ;
				PcWrite		<= 0     ;
				Branch		<= 0     ;
				RegWrite		<= 0     ;
				ALUControl	<= 3'b000;
				ALUOp			<=	2'b00 ;
				
				state 		<= 4'b0000;
				
			end
			
			4'b1011:
			begin
			
				MemToReg		<= 0	   ;
				RegDes		<= 0 	   ;
				IorD 			<= 0     ;
				PcSrc			<= 0     ;
				ALUSrcB		<= 2'b00 ;
				ALUSrcA 		<= 0     ;
				IRWrite		<= 0     ;
				MemWrite		<= 0     ;
				PcWrite		<= 0     ;
				Branch		<= 0     ;
				RegWrite		<= 0     ;
				ALUControl	<= 3'b000;
				ALUOp			<=	2'b00 ;
				
				state 		<= 4'b0000;
				
			end
		endcase
	end
endmodule
