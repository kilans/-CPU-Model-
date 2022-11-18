`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/11 08:32:33
// Design Name: 
// Module Name: cpu_top
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


module cpu(
input wire clk,
input wire RESET,
output wire T0,T1,T2,T3,T4,T5,T6,T7,
output wire   IMAR,IIR,IDR,IPC,IADD,ISUB,IAND,IOR,ISTO,EALU,IA,EA,EDR,
output wire LD,ADD,SUB,AND,OR,STO,HALT,
output wire [3:0] PC_addr,
output wire [3:0] ABUS,
output wire [7:0] DBUS,

output wire [7:0] DBUS_DR,
output wire [7:0] alu_out,
output wire [7:0] Dout_acc
 
//output wire   IMAR,IIR,IDR,IPC,IADD,ISUB,IAND,IOR,EALU,IA,EA,EDR
    );
   // wire   IMAR,IIR,IDR,IPC,IADD,ISUB,IAND,IOR,ISTO,EALU,IA,EA,EDR;
//    wire [3:0] PC_addr;
//    wire [3:0] ABUS;
//    wire [7:0] DBUS;
//    wire [7:0] DBUS_DR;
//wire RESET;
//assign RESET=rst^HALT;
 //wire T0,T1,T2,T3,T4,T5,T6,T7;
 //wire LD,ADD,SUB,AND,OR,HALT;
// wire [7:0] Dout_acc;
//wire [7:0] Dout_acc;
//wire T0,T1,T2,T3,T4,T5,T6,T7;
//wire   IMAR,IIR,IDR,IPC,IADD,ISUB,IAND,IOR,EALU,IA,EA,EDR;
wire SE;
PC PC(clk,RESET,IPC,PC_addr);
MAR MAR(clk,IMAR,PC_addr,ABUS);
M M(DBUS_DR,ABUS,Dout_acc,ISTO);
DR DR(clk,IDR,EDR,DBUS_DR,DBUS);
acc acc(clk,IA,EA,SE,DBUS,alu_out,Dout_acc);
alu alu1(clk,RESET,EALU,Dout_acc,DBUS,IADD,ISUB,IAND,IOR,alu_out);
IR IR(clk,IIR,DBUS,LD,ADD,SUB,AND,OR,STO,HALT);
control control(T0,T1,T2,T3,T4,T5,T6,T7,LD,ADD,SUB,AND,OR,STO,HALT,IMAR,IIR,IDR,IPC,IADD,ISUB,IAND,IOR,ISTO,EALU,IA,EA,EDR,SE);
pulse pulse(clk,RESET,HALT,T0,T1,T2,T3,T4,T5,T6,T7);
endmodule
