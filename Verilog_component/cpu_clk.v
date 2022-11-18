`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/05 16:55:46
// Design Name: 
// Module Name: cpu_clk
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


module cpu_clk(cpu_clk);
output cpu_clk;
reg reset;
reg clk;
    divide u1(clk,reset,cpu_clk);
    initial begin
        clk = 0;reset=0;
        #5 reset=1;
    end
    always #5 clk=!clk;
    
endmodule
