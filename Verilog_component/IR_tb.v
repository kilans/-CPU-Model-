`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/10 09:23:08
// Design Name: 
// Module Name: IR_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module IR_tb();
    reg clk, IIR;
    reg [7:0]data; 
    wire LD,ADD,SUB,AND,OR,HALT;
    IR IR_tb(clk,IIR,data, LD,ADD,SUB,AND,OR,HALT);
	initial
	    begin
        clk=0;IIR=0;data=8'b0001000;
	    #10 IIR=1; data=8'b0001000;
	     #10 IIR=1;data=8'b0011001;
	     #10 IIR=1;data=8'b0101010;
	     #10 IIR=1;data=8'b0111011;
	     #10 IIR=1;data=8'b1001100;
	     #10 IIR=1;data=8'b1011101;
	     #10 IIR=1;data=8'b1111110;
	    end
	always #2 clk=~clk;//产生一个系统时钟。
endmodule


