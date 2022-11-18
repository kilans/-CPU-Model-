`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/10 10:14:31
// Design Name: 
// Module Name: control
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



module control(
input T0,T1,T2,T3,T4,T5,T6,T7,
input LD,ADD,SUB,AND,OR,STO,HALT,
output IMAR,IIR,IDR,IPC,IADD,ISUB,IAND,IOR,ISTO,EALU,IA,EA,EDR,SE
    );
assign SE = LD;
assign IMAR=~(T0|(T3&LD)|(T3&ADD)|(T3&SUB)|(T3&AND)|(T3&OR)|(T3&STO));  
assign IDR=T1|T4&LD|T4&ADD|T4&SUB|T4&AND|(T4&OR)|(T4&STO);  
assign IPC=T2|T5;//T5&LD|T5&ADD|T5&SUB|T5&AND|T5&OR|T5&STO|T5&HALT;  
assign IIR=~T2;  
assign IADD=~(T5&ADD);  
assign ISUB=~(T5&SUB);  
assign IAND=~(T5&AND);  
assign IOR=~(T5&OR);  
assign ISTO=~(T6&STO);
assign IA=~(T6&LD|T6&ADD|T6&SUB|T6&AND|T6&OR|T6&STO);  
assign EALU=~(T6&ADD|T6&SUB|T6&AND|T6&OR);//|T6&STO);  
assign EA=~(T6&ADD|T6&SUB|T6&AND|T6&OR|T6&STO);  
assign EDR=T6&ADD|T6&SUB|T6&AND|T6&OR|T7&ADD|T7&SUB|T7&AND|T7&OR|T7&STO;    
endmodule
