`timescale 1ns / 1ps


module ALU(
    input [31:0] SrcA,
	 input [31:0] SrcB,
	 input [2:0] ALUControl,
	 output reg [31:0] ALUResult,
	 output Zero
	 );
	 
always @ (SrcA or SrcB or ALUConcontrol) begin

	case(ALUControl)
	
		3'b000: begin      //add,addi,sw,lw
		
			ALUResult <= SrcA + SrcB;
			
			if (ALUResult == 32'b0) Zero <= 1'b1;
			
			else Zero <= 1'b0;

		end
		
		3'b001: begin   //beq
		
			if(SrcA == SrcB) Zero <= 1'b1;
			
			if (ALUResult == 32'b0) Zero <= 1'b1;
			
			else 	Zero <= 1'b0;

		end
		
		3'b010: begin  //AND
		
			ALUResult <= SrcA & SrcB;
			
			if (ALUResult == 32'b0) Zero <= 1'b1;
			
			else Zero <= 1'b0;
			
		end
		
		3'b011: begin  //XOR
		
			ALUResult <= SrcA ^ SrcB;
			
			if (ALUResult == 32'b0) Zero <= 1'b1;
			
			else Zero <= 1'b0;
			
		end

		3'b100: begin  //OR
		
			ALUResult <= SrcA | SrcB;
			
			if (ALUResult == 32'b0) Zero <= 1'b1;
			
			else Zero <= 1'b0;
			
		end
		
	endcase
	
	end
		
endmodule
