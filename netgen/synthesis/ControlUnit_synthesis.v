////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: ControlUnit_synthesis.v
// /___/   /\     Timestamp: Sun Jun 30 15:17:29 2019
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim ControlUnit.ngc ControlUnit_synthesis.v 
// Device	: xc6slx9-2-tqg144
// Input file	: ControlUnit.ngc
// Output file	: F:\MultiCycleCpu\netgen\synthesis\ControlUnit_synthesis.v
// # of Modules	: 1
// Design Name	: ControlUnit
// Xilinx        : C:\Xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module ControlUnit (
  CLK, MemToReg, RegDes, IorD, PcSrc, ALUSrcA, IRWrite, MemWrite, PcWrite, Branch, RegWrite, OpCode, Function, ALUSrcB, ALUControl
);
  input CLK;
  output MemToReg;
  output RegDes;
  output IorD;
  output PcSrc;
  output ALUSrcA;
  output IRWrite;
  output MemWrite;
  output PcWrite;
  output Branch;
  output RegWrite;
  input [5 : 0] OpCode;
  input [5 : 0] Function;
  output [1 : 0] ALUSrcB;
  output [2 : 0] ALUControl;
  wire RegWrite_OBUF_0;
  GND   XST_GND (
    .G(RegWrite_OBUF_0)
  );
  OBUF   ALUSrcB_1_OBUF (
    .I(RegWrite_OBUF_0),
    .O(ALUSrcB[1])
  );
  OBUF   ALUSrcB_0_OBUF (
    .I(RegWrite_OBUF_0),
    .O(ALUSrcB[0])
  );
  OBUF   ALUControl_2_OBUF (
    .I(RegWrite_OBUF_0),
    .O(ALUControl[2])
  );
  OBUF   ALUControl_1_OBUF (
    .I(RegWrite_OBUF_0),
    .O(ALUControl[1])
  );
  OBUF   ALUControl_0_OBUF (
    .I(RegWrite_OBUF_0),
    .O(ALUControl[0])
  );
  OBUF   MemToReg_OBUF (
    .I(RegWrite_OBUF_0),
    .O(MemToReg)
  );
  OBUF   RegDes_OBUF (
    .I(RegWrite_OBUF_0),
    .O(RegDes)
  );
  OBUF   IorD_OBUF (
    .I(RegWrite_OBUF_0),
    .O(IorD)
  );
  OBUF   PcSrc_OBUF (
    .I(RegWrite_OBUF_0),
    .O(PcSrc)
  );
  OBUF   ALUSrcA_OBUF (
    .I(RegWrite_OBUF_0),
    .O(ALUSrcA)
  );
  OBUF   IRWrite_OBUF (
    .I(RegWrite_OBUF_0),
    .O(IRWrite)
  );
  OBUF   MemWrite_OBUF (
    .I(RegWrite_OBUF_0),
    .O(MemWrite)
  );
  OBUF   PcWrite_OBUF (
    .I(RegWrite_OBUF_0),
    .O(PcWrite)
  );
  OBUF   Branch_OBUF (
    .I(RegWrite_OBUF_0),
    .O(Branch)
  );
  OBUF   RegWrite_OBUF (
    .I(RegWrite_OBUF_0),
    .O(RegWrite)
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

