`timescale 1ns / 1ps


module Memory(
	input clk,
	input [31:0] Adr,
	input [31:0] WD,
	input WE,
	output reg [31:0] RD
    );
	 
reg [7:0] mem [2047:0];

initial 

		begin
		
			$readmemb("instructions.txt", mem);
			
		end
		
always @(posedge clk)

begin

    if (WE) begin
	 
        mem[Adr] = WD[31:24];
		  
        mem[Adr+1] = WD[23:16];
		  
        mem[Adr+2] = WD[15:8];
		  
        mem[Adr+3]   = WD[7:0];

    end
	 
end

assign RD = {mem[Adr],mem[Adr+1],mem[Adr+2],mem[Adr+3]};

endmodule
