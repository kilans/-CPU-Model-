`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/10 15:34:46
// Design Name: 
// Module Name: PC_tb
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
module PC_tb();
    reg clk, IPC,CLRn;
    wire [3:0] PC_addr;
    PC PC_tb(clk,IPC,CLRn,PC_addr);
	initial
	    begin
        clk=0;IPC=0;CLRn=1;
        #55 IPC=1;CLRn=1;
        #70 IPC=1;CLRn=0;
        #20 IPC=1;CLRn=1;
	
	    end
	always #2 clk=~clk;//产生一个系统时钟。
endmodule

