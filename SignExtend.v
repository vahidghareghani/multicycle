`timescale 1ns / 1ps


module SignExtend(
	input [15:0] Imm,
	output [31:0] EXImm
    );	 

assign	EXImm = {{16{Imm[15]}},Imm};

endmodule
