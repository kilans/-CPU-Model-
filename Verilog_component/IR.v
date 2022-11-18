`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/10 08:58:18
// Design Name: 
// Module Name: IR
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


module IR(
input clk,
input IIR,
input [7:0]Din,
output LD,
output ADD,
output SUB,
output AND,
output OR,
output STO,
output HALT
    );
    reg [7:0]data;
    reg LD_S=0; assign  LD=LD_S;    
    reg ADD_S=0; assign ADD=ADD_S; 
    reg SUB_S=0; assign SUB=SUB_S; 
    reg AND_S=0; assign AND=AND_S; 
    reg OR_S=0;  assign  OR=OR_S; 
    reg STO_S=0; assign  STO=STO_S; 
    reg HALT_S=0; assign  HALT=HALT_S;
    always @(negedge IIR) 
    begin
    //if(!IIR)
    //begin
    case({Din[2],Din[1],Din[0]})
    3'b000:
    begin {LD_S,ADD_S,SUB_S,AND_S,OR_S,STO_S,HALT_S}<=7'b1000000; end  
    3'b001:
    begin {LD_S,ADD_S,SUB_S,AND_S,OR_S,STO_S,HALT_S}<=7'b0100000; end  
    3'b010:
    begin {LD_S,ADD_S,SUB_S,AND_S,OR_S,STO_S,HALT_S}<=7'b0010000; end  
    3'b011:
    begin {LD_S,ADD_S,SUB_S,AND_S,OR_S,STO_S,HALT_S}<=7'b0001000; end  
    3'b100:
    begin {LD_S,ADD_S,SUB_S,AND_S,OR_S,STO_S,HALT_S}<=7'b0000100; end  
    3'b101:
    begin {LD_S,ADD_S,SUB_S,AND_S,OR_S,STO_S,HALT_S}<=7'b0000010; end
     3'b110:
    begin {LD_S,ADD_S,SUB_S,AND_S,OR_S,STO_S,HALT_S}<=7'b0000001; end    
    default:{LD_S,ADD_S,SUB_S,AND_S,OR_S,STO_S,HALT_S}<=7'b0000000;
    endcase
    end
    //else begin{LD_S,ADD_S,SUB_S,AND_S,OR_S,HALT_S}<=6'b000000;end
    //end
endmodule
