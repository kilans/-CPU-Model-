`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/10 17:05:53
// Design Name: 
// Module Name: M_tb
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
module M_tb();
    //reg clk;
    reg [3:0] addr;
    wire [7:0] data;
    M M_tb(data,addr);
	initial
	    begin
        addr=4'h0;
        #20 addr=4'hc; 
        #20 addr=4'hd;
        #20 addr=4'he;
        #20 addr=4'hf;
	    end
	   //always #2 clk=~clk;//产生一个系统时钟。
endmodule

