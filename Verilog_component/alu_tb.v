`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/10 12:27:10
// Design Name: 
// Module Name: alu_tb
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
module alu_tb();
    reg clk, rst, EALU;
    reg [7:0]data; 
    reg [7:0]accum;
    reg IADD, ISUB, IAND, IOR;
    wire [7:0]alu_out;
    alu alu_tb(clk,rst,EALU,data,accum,IADD,ISUB,IAND,IOR,alu_out);
	initial
	    begin
        clk=0;rst=0;data=8'h07;accum=8'h06;{EALU,IADD,ISUB,IAND,IOR}=5'b00111;
	    #10 rst=0;data=8'h07;accum=8'h06; {EALU,IADD,ISUB,IAND,IOR}=5'b10111;
	    #10 rst=0;data=8'h07;accum=8'h06; {EALU,IADD,ISUB,IAND,IOR}=5'b11011;
	    #10 rst=0;data=8'h07;accum=8'h06; {EALU,IADD,ISUB,IAND,IOR}=5'b11101;
	    #10 rst=0;data=8'h07;accum=8'h06; {EALU,IADD,ISUB,IAND,IOR}=5'b11110;
	    #10 rst=1;data=8'h07;accum=8'h06; {EALU,IADD,ISUB,IAND,IOR}=5'b10111;
	    end
	always #1 clk=~clk;//产生一个系统时钟。
endmodule


