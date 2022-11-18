`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/10 17:45:45
// Design Name: 
// Module Name: DR
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
module DR(
input wire clk,
input wire IDR,
input wire EDR,
input wire [7:0]D_IN,
output wire [7:0]D_OUT
    );
 reg [7:0]data;
// reg [7:0]data_out;
  assign D_OUT=(EDR)?data:D_IN;
 always @(*)
 begin
 if(IDR)
 begin
 data=D_IN;
 end 
 end
  
endmodule


