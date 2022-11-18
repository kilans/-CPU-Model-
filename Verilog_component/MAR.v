`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/10 16:05:46
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


module MAR(
input clk,IMR,
input [3:0]addr,
output [3:0] ABUS
    );
reg [3:0]addr_reg=0;
assign ABUS=addr_reg;
always@(*)
begin
if(!IMR)
begin addr_reg=addr; end
end
endmodule
