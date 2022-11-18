`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/10 17:05:37
// Design Name: 
// Module Name: M
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

module M( data,addr,data_sto,ISTO);
 
    output wire [7:0] data;
    input [3:0] addr;
    input [7:0] data_sto;
    input ISTO;
    reg [7:0] memory [4'hf:0];
    //reg [3:0] addr_a;
    initial begin
    memory[4'h0]=8'b0001_0000;//LD
    memory[4'h1]=8'b0000_0101;//5
    memory[4'h2]=8'b0001_0001;//ADD
    memory[4'h3]=8'b0000_1011;//11
    memory[4'h4]=8'b0001_0010;//SUB
    memory[4'h5]=8'b0001_0001;//17
    memory[4'h6]=8'b0001_0011;//AND
    memory[4'h7]=8'b0000_1000;//8
    memory[4'h8]=8'b0001_0100;//OR
    memory[4'h9]=8'b0000_1001;//9
    memory[4'ha]=8'b0001_0001;//ADD
    memory[4'hb]=8'b0000_0110;//6
    memory[4'hc]=8'b0000_0101;//STO
    memory[4'hd]=8'b0000_0101;//5
    memory[4'he]=8'b0001_0010;//SUB
    memory[4'hf]=8'b0000_0111;//7
    

    //memory[4'hf]=8'h01;
    //memory[4'he]=8'h02;
    //memory[4'hd]=8'h03;
    //memory[4'hc]=8'h04;
    end
    assign data=memory[addr];
    always @(*)
    begin
    if(!ISTO)
    memory[data] =data_sto;
    end
   
    //定义了一个8位宽，深度为1_1111_1111的存储阵列
    //当read模式、enable时，读addr的存储指令，否则就是高阻态
endmodule

