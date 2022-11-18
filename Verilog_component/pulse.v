`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/09 19:12:08
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


module pulse(
input wire clk,
input wire rst,
input wire halt,
output wire T0,T1,T2,T3,T4,T5,T6,T7
);
reg [7:0] T=8'd1;
assign T0=T[0];
assign T1=T[1];
assign T2=T[2];
assign T3=T[3];
assign T4=T[4];
assign T5=T[5];
assign T6=T[6];
assign T7=T[7];
always @( posedge clk or  posedge rst)
begin
if(rst)
   begin T<=8'd1;end 
//else if(halt)
//   begin T=8'hxx;  end
else 
  begin
  T[0]<=T[7];
  T[1]<=T[0];
  T[2]<=T[1];
  T[3]<=T[2];
  T[4]<=T[3];
  T[5]<=T[4];
  T[6]<=T[5];
  T[7]<=T[6];
  end
end
endmodule
