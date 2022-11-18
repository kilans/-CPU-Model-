`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/10 17:46:00
// Design Name: 
// Module Name: DR_tb
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

module DR_tb();
    reg clk, IDR,EDR;
    reg [7:0]Din; 
    wire [7:0]Dout;
    DR DR_tb(clk,IDR,EDR,Din,Dout);
	initial
	    begin
        clk=0;IDR=1;EDR=1;Din=8'h13;
	     #10  IDR=1;EDR=0;Din=8'h13;
	     #10  IDR=0;EDR=1;Din=8'h13;
	     #10  IDR=1;EDR=0;Din=8'h13;
	     #10  IDR=1;EDR=1;Din=8'h13;
	     #10  IDR=1;EDR=0;Din=8'h14;
	     #10  IDR=1;EDR=1;//Din=8'h13;
	     #10  IDR=0;EDR=1;//Din=8'h13;
	     
	    end
	always #2 clk=~clk;//产生一个系统时钟。
endmodule
