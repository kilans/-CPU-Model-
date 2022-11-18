`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/10 12:26:00
// Design Name: 
// Module Name: alu
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


module alu(
   input wire clk,
   input wire rst,
   input wire EALU,
   input  wire[7:0] data,
   input wire [7:0] accum,
   input wire IADD,
   input wire ISUB,
   input wire IAND,
   input wire IOR,
   output wire[7:0]alu_out
//   output wire[7:0]dbus
    );
    reg [7:0] result;
    wire[7:0] add_out;
    wire[7:0] sub_out;
    wire[7:0] and_out;
    wire[7:0] or_out;
    assign alu_out=(!EALU)?result:result;
always@(*)
begin
    begin 
     if(!IADD)
     begin result=add_out; end
     else if(!ISUB)
     begin result=sub_out; end
     else if(!IAND)
     begin result=data&accum; end
     else if(!IOR)
     begin result=data|accum; end
    end
end
 full_adder8 u0(accum,data,IADD,add_out);
 sub8 u1(data,accum,ISUB,sub_out);
 
 

endmodule
///8位串行加法器
module full_adder8(
 input wire [7:0] B, //输入加数
 input wire [7:0] A,  //输入被加数
 input wire E,//控制端
 output wire [7:0] S //输出和
);
wire C0;
reg C01=0;
wire C8; //向高位进位输出
assign C0=C01;
//线网类型
wire C1,C2,C3,C4,C5,C6,C7;
//例化8个1位全加器
full_adder u0(.Cin(C0),.B(B[0]),.A(A[0]),.S(S[0]),.Cout(C1),.E(E));
full_adder u1(.Cin(C1), .B(B[1]),.A(A[1]),.S(S[1]),.Cout(C2),.E(E));
full_adder u2(.Cin(C2),.B(B[2]),.A(A[2]), .S(S[2]),.Cout(C3),.E(E));
full_adder u3(.Cin(C3),.B(B[3]),.A(A[3]), .S(S[3]),.Cout(C4),.E(E));
full_adder u4(.Cin(C4),.B(B[4]),.A(A[4]),.S(S[4]),.Cout(C5),.E(E));
full_adder u5( .Cin(C5),.B(B[5]),.A(A[5]),.S(S[5]),.Cout(C6),.E(E));
full_adder u6(.Cin(C6),.B(B[6]),.A(A[6]),.S(S[6]),.Cout(C7),.E(E));
full_adder u7(.Cin(C7),.B(B[7]),.A(A[7]),.S(S[7]),.Cout(C8), .E(E));
endmodule
//功能描述：数据流描述的全加器 
module full_adder(A,B,Cin,S,Cout,E);
 input A; //输入端口
 input B; //输入端口
 input Cin; //低位进位,输入端口
 input E;//控制端
 output S; //本位和，输出端口
 output Cout; //向高位进位，输出端口
 wire h; 
 assign h = A^B;
 assign S = (Cin^h)&(!E);
 assign Cout = ((A&B)|(h&Cin))&(!E);
endmodule
module sub8(A, B,E,S);
  input wire [7:0] A;
  input wire [7:0] B;
  input wire E;
  output reg[7:0] S; //diff
  reg Cin; //borrow from high bit
  reg [8:0] c;
  integer k;

  always @(A,B,E) begin
    c[0] = 1'b0;
	 for(k = 0; k < 8; k = k + 1) begin
	     S[k] =(!E)&( A[k]^B[k]^c[k]);
	     c[k+1] =(!E)& (~A[k]&(B[k]^c[k]))|(B[k]&c[k]);
	 end
	 Cin = c[8];

  end

endmodule
