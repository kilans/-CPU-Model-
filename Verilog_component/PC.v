`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/10 15:09:17
// Design Name: 
// Module Name: PC
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

module PC(
input clk,CLRn,IPC,
output [3:0]PC_addr
    );
//LS161 u0(.CLK(clk),.CLRn(!CLRn),.ENP(!IPC),.ENT(!IPC),.Q(PC_addr));
reg [3:0] pc_addr=0;
assign PC_addr=pc_addr;

always @(*)
begin
if(CLRn)
begin
pc_addr=0;
end
else if(IPC)
begin pc_addr=pc_addr+1;end
end    
endmodule
//74161逻辑电路描述
//74161逻辑电路的源程序
//`timescale 1ns/10ps
//module LS161(
//input wire CLK,
//input wire CLRn,
//input wire LDn,
//input wire ENP,
//input wire ENT,
//input wire [3:0] D,
//output wire [3:0] Q,
//output wire RCO);
////线网类型说明和功能定义
//wire DA,DB,DC,DD;
//wire ENA;
//reg FF0,FF1,FF2,FF3;
//reg LDN=1;
//assign LDn=LDN;
//assign Q = {FF3,FF2,FF1,FF0};
//assign RCO = FF1 & FF2 & FF3 & FF0 & ENT;
//assign ENA = ENT & ENP & LDn;
//assign DA = (FF0 & LDn) ^ ((D[0] & ~LDn) | ENA);
//assign DB = (FF1 & LDn) ^ ((D[1] & ~LDn) | (ENA & FF0));
//assign DC = (FF2 & LDn) ^ ((D[2] & ~LDn) | (ENA & FF0 & FF1));
//assign DD = (FF3 & LDn) ^ ((D[3] & ~LDn) | (ENA & FF0 & FF1 & FF2));
//always @ ( posedge CLK or negedge CLRn ) begin
// if ( ~CLRn )
// {FF3,FF2,FF1,FF0} <= 4'b0000;
// else
// {FF3,FF2,FF1,FF0} <= {DD,DC,DB,DA};
// end
//endmodule
