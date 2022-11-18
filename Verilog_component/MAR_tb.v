`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/10 16:20:46
// Design Name: 
// Module Name: MAR
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


module MAR_tb();
    reg clk, IMR;
    reg [3:0] addr;
    wire [3:0] ABUS;
    MAR MAR_tb(clk,IMR,addr,ABUS);
	initial
	    begin
        clk=0;IMR=1;addr=4'h5;
        #20 IMR=0;
        #20 IMR=1;addr=4'h6;
        #20 IMR=0;	
	    end
	always #2 clk=~clk;//产生一个系统时钟。
endmodule
