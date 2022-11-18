`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/10 14:52:24
// Design Name: 
// Module Name: acc_tb
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
module acc_tb();
    reg clk, IA,EA;
    reg [7:0]Din; 
    wire [7:0]Dout;
    acc IR_tb(clk,IA,EA,Din,Dout);
	initial
	    begin
        clk=0;IA=1;EA=1;Din=8'h13;
	     #10  IA=0;EA=1;Din=8'h13;
	     #10  IA=1;EA=1;Din=8'h13;
	     #10  IA=1;EA=0;Din=8'h13;
	     #10  IA=1;EA=1;Din=8'h13;
	     #10  IA=0;EA=1;Din=8'h14;
	     #10  IA=1;EA=1;//Din=8'h13;
	     #10  IA=1;EA=0;//Din=8'h13;
	     
	    end
	always #2 clk=~clk;//产生一个系统时钟。
endmodule

