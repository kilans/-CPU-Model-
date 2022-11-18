`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/11 19:05:41
// Design Name: 
// Module Name: cpu_tb
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

module cpu_tb(cpu_clk,LD,ADD,SUB,AND,OR,STO,HALT,T0,T1,T2,T3,T4,T5,T6,T7,alu_out,acc_out,seg7,an);
reg clk,RESET,reset;
output cpu_clk;
output LD,ADD,SUB,AND,OR,STO,HALT ;
output T0,T1,T2,T3,T4,T5,T6,T7 ;
output [6:0]seg7;
output [7:0]an;
output [7:0] alu_out;
output [7:0] acc_out;
//output [7:0] alu_in;


cpu_top cpu_tb(.clk(clk),.reset(reset),.RESET(RESET),.T0(T0),.T1(T1),.T2(T2),
    .T3(T3),.T4(T4),.T5(T5),.T6(T6),.T7(T7),.LD(LD),.ADD(ADD),
    .SUB(SUB),.AND(AND),.OR(OR),.STO(STO),.HALT(HALT));
    
assign cpu_clk = cpu_tb.cpu_clk;
//assign alu_in = cpu_tb.u1.alu1.accum;
    
seg_7 S(.clk(clk),
    .mem(cpu_tb.acc),
    .data(cpu_tb.alu),
    .an(an),
    .seg7(seg7)
    );
//assign imar = C.IMAR;


assign alu_out = cpu_tb.alu;
assign acc_out = cpu_tb.acc;
initial
	    begin
        clk=0;RESET=0;reset=0;
	    #200
	    reset=1;
	   // RESET=1;
	    #200
	    #500
	    //RESET=1;
	    #700$stop;
	    end
	always #2 clk=~clk;//产生一个系统时钟。
endmodule
