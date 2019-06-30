`timescale 1ns / 1ps


module CPU(
	input clk
    );
	 
wire [31:0] pc;
wire [31:0] adr;
wire [31:0] rd;
wire [31:0] instr;
wire [31:0] data;
wire [31:0] rd1;
wire [31:0] rd2;
wire [4:0] a3;
wire [31:0] wd3;
wire [31:0] a;
wire [31:0] b;
wire [31:0] signimm;
wire [31:0] src_a;
wire [31:0] src_b;
wire zero;
wire [31:0] alu_result;
wire [31:0] alu_out;
wire [31:0] pc_;



CondLatch latch_pc (
    .clk(clk), 
    .IN(pc_), 
    .WE(PCEn), 
    .OUT(pc)
    );

MUX_2__32 adr_ (
    .O(pc), 
    .I(alu_out), 
    .Sel(IorD), 
    .OUT(adr)
    );

Memory memory (
    .clk(clk), 
    .Adr(adr), 
    .WD(b), 
    .WE(MemWrite), 
    .RD(rd)
    );

CondLatch latch_instr (
    .clk(clk), 
    .IN(rd), 
    .WE(IRWrite), 
    .OUT(instr)
    );

Latch latch_data (
    .clk(clk), 
    .IN(rd), 
    .OUT(data)
    );

MUX_2__5 regdst (
    .O(instr[20:16]), 
    .I(instr[15:11]), 
    .Sel(RegDst), 
    .OUT(a3)
    );

MUX_2__32 memtoreg(
    .O(alu_out), 
    .I(data), 
    .Sel(MemtoReg), 
    .OUT(wd3)
    );	 

RegisterFile registerfile (
    .clk(clk), 
    .A1(instr[25:21]), 
    .A2(instr[20:16]), 
    .A3(a3), 
    .WD3(wd3), 
    .WE3(RegWrite), 
    .RD1(rd1), 
    .RD2(rd2)
    );

SignExtend signextend (
    .Imm(instr[15:0]), 
    .EXImm(signimm)
    );
	 
Latch latch_rd1 (
    .clk(clk), 
    .IN(rd1), 
    .OUT(a)
    );

Latch latch_rd2 (
    .clk(clk), 
    .IN(rd2), 
    .OUT(b)
    );

MUX_2__32 alu_src_a(
    .O(pc), 
    .I(a), 
    .Sel(ALUSrcA), 
    .OUT(src_a)
    );

MUX_4__32 alu_src_b (
    .OO(b), 
    .OI(4), 
    .IO(signimm), 
    .II(signimm<<2), 
    .Sel(ALUSrcB), 
    .OUT(src_b)
    );

ALU alu (
    .SrcA(src_a), 
    .SrcB(src_b), 
    .ALUControl(ALUControl), 
    .ALUResult(alu_result), 
    .Zero(zero)
    );

Latch latch_alu_out (
    .clk(clk), 
    .IN(alu_result), 
    .OUT(alu_out)
    );

MUX_4__32 pc_src (
    .OO(alu_result), 
    .OI(alu_out),
    .IO({{pc[31:28]},{instr[25:0]<<2}}), 
    .II(0), 
    .Sel(PCSrc), 
    .OUT(pc_)
    );	 

	 
endmodule
