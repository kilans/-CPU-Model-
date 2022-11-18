`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/10 12:43:52
// Design Name: 
// Module Name: acc
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


module acc(
input wire clk,
input wire IA,
input wire EA,
input wire SE,
input wire [7:0]Din,alu,
output wire [7:0]Dout
    );
 reg [7:0]data=0;
 //reg [7:0]data_out;
  assign Dout=data;
 always @(*)
 begin
 if(!IA)
 begin
 if(SE)
 data=Din;
 else
 data=alu; 
 end 
 end
endmodule
