`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/09 19:43:45
// Design Name: 
// Module Name: pulse
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


module tb();
	reg clk,rst;
    wire T0,T1,T2,T3,T4,T5,T6,T7;
	initial
	    begin
        clk=0;rst=0;
	    #10 rst=1;
	    #10 rst=0;
	    end
	pulse pulse(clk,rst,T0,T1,T2,T3,T4,T5,T6,T7);
	always #2 clk=~clk;//产生一个系统时钟。
	endmodule
