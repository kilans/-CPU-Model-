`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/10 11:07:11
// Design Name: 
// Module Name: control_tb
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
module control_tb();
    reg T0,T1,T2,T3,T4,T5,T6,T7;
    reg LD,ADD,SUB,AND,OR;
    wire IMAR,IIR,IDR,IPC,IADD,ISUB,IAND,IOR,EALU,IA,EA,EDR;
    control control_tb(T0,T1,T2,T3,T4,T5,T6,T7,LD,ADD,SUB,AND,OR,IMAR,IIR,IDR,IPC,IADD,ISUB,IAND,IOR,EALU,IA,EA,EDR);
	initial
	    begin
	    //LD
        {T0,T1,T2,T3,T4,T5,T6,T7}=8'b1000_0000;{LD,ADD,SUB,AND,OR}=5'b1000_0;
	    #2 {T0,T1,T2,T3,T4,T5,T6,T7}=8'b0100_0000;{LD,ADD,SUB,AND,OR}=5'b1000_0;
	    #2 {T0,T1,T2,T3,T4,T5,T6,T7}=8'b0010_0000;{LD,ADD,SUB,AND,OR}=5'b1000_0;
	    #2 {T0,T1,T2,T3,T4,T5,T6,T7}=8'b0001_0000;{LD,ADD,SUB,AND,OR}=5'b1000_0;
	    #2 {T0,T1,T2,T3,T4,T5,T6,T7}=8'b0000_1000;{LD,ADD,SUB,AND,OR}=5'b1000_0;
	    #2 {T0,T1,T2,T3,T4,T5,T6,T7}=8'b0000_0100;{LD,ADD,SUB,AND,OR}=5'b1000_0;
	    #2 {T0,T1,T2,T3,T4,T5,T6,T7}=8'b0000_0010;{LD,ADD,SUB,AND,OR}=5'b1000_0;
	    #2 {T0,T1,T2,T3,T4,T5,T6,T7}=8'b0000_0001;{LD,ADD,SUB,AND,OR}=5'b1000_0;
	    //ADD
	    #2 {T0,T1,T2,T3,T4,T5,T6,T7}=8'b1000_0000;{LD,ADD,SUB,AND,OR}=5'b0_1000;
	    #2 {T0,T1,T2,T3,T4,T5,T6,T7}=8'b0100_0000;{LD,ADD,SUB,AND,OR}=5'b0_1000;
	    #2 {T0,T1,T2,T3,T4,T5,T6,T7}=8'b0010_0000;{LD,ADD,SUB,AND,OR}=5'b0_1000;
	    #2 {T0,T1,T2,T3,T4,T5,T6,T7}=8'b0001_0000;{LD,ADD,SUB,AND,OR}=5'b0_1000;
	    #2 {T0,T1,T2,T3,T4,T5,T6,T7}=8'b0000_1000;{LD,ADD,SUB,AND,OR}=5'b0_1000;
	    #2 {T0,T1,T2,T3,T4,T5,T6,T7}=8'b0000_0100;{LD,ADD,SUB,AND,OR}=5'b0_1000;
	    #2 {T0,T1,T2,T3,T4,T5,T6,T7}=8'b0000_0010;{LD,ADD,SUB,AND,OR}=5'b0_1000;
	    #2 {T0,T1,T2,T3,T4,T5,T6,T7}=8'b0000_0001;{LD,ADD,SUB,AND,OR}=5'b0_1000;
	    #2 {T0,T1,T2,T3,T4,T5,T6,T7}=8'b1000_0000;{LD,ADD,SUB,AND,OR}=5'b0_1000;
	    end
endmodule


