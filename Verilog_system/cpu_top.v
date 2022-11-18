`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/13 17:39:23
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


module cpu_top(
input wire clk,
input wire RESET,
input wire reset,
output wire T0,T1,T2,T3,T4,T5,T6,T7,
output wire LD,ADD,SUB,AND,OR,STO,HALT,
output wire [7:0]an,
output wire [6:0]seg7
    );
wire [7:0] acc;
wire [7:0] alu;
wire  cpu_clk;
divide u0(clk,reset,cpu_clk);
cpu u1( .clk(clk),.RESET(RESET),.T0(T0),.T1(T1),.T2(T2),.T3(T3),.T4(T4),.T5(T5),.T6(T6),.T7(T7),
 .LD(LD),.ADD(ADD),.SUB(SUB),.AND(AND),.OR(OR),.STO(STO),.HALT(HALT),.alu_out(alu),.Dout_acc(acc));
seg_7 u2(clk,acc,alu,seg7,an);
//
endmodule
//module divide(
//input clk,
//output cpu_clk,
//output seg_clk);
//assign cpu_clk=clk;
//assign seg_clk=clk;

//endmodule
//module seg7(
//input clk,
//input [7:0]data,
//input [7:0]accum,
//output [7:0]alu,
//output [7:0]acc);
//assign alu=data;
//assign acc=accum;

//endmodule
module divide(clk,res,T1hz);//1Hz��Ƶ
input clk;
input res;
output reg T1hz;
reg[25:0] count;
always@(posedge clk or negedge res)begin
if(~res)count<=26'd0;
else if(count<26'd49999999)
count<=count+1;
else count<=26'd0;
end
always@(posedge clk or negedge res)begin
if(~res)T1hz<=0;
else if(count==26'd0)
T1hz<=~T1hz;
end
endmodule

module seg_7(
    input wire clk,
    input wire [7:0]mem,    //�洢
    input wire [7:0]data,   //�Ĵ���
    output reg [6:0] seg7,
    output reg [7:0] an
//    output [1:0]test
    );
//    reg d_temp;
//reg[18:0]cnt;
//wire[2:0]flip_led;
//assign flip_led=cnt[18:16];
//always@(posedge clk)begin
//cnt<=cnt+1;
//end

//always@(*)begin
//case(flip_led)
//0:begin an=8'b1111_1110;d_temp=mem[0];end
//1:begin an=8'b1111_1101;d_temp=mem[1];end
//2:begin an=8'b1111_1011;d_temp=mem[2];end
//3:begin an=8'b1111_0111;d_temp=mem[3];end
//4:begin an=8'b1110_1111;d_temp=mem[4];end
//5:begin an=8'b1101_1111;d_temp=mem[5];end
//6:begin an=8'b1011_1111;d_temp=mem[6];end
//7:begin an=8'b0111_1111;d_temp=mem[7];end
//default an=8'b1111_1111;
//endcase
//end

//always@(d_temp)begin
//case(d_temp)
//1'b0:seg7<=7'b000_0001;
//1'b1:seg7<=7'b100_1111;
//endcase
//end
	 reg [2:0]q; //瀹氫箟閫夋嫨鍙橀噺锛�?敤鏉ラ�夋嫨鍝釜鏁扮爜绠℃樉绀烘暟鎹互鍙婃樉�?哄摢涓暟鎹�?
	 reg [3:0] d;
	 wire [3:0] ge; //瀹氫箟鏄剧ず鏁版嵁鐨勫瘎瀛樺櫒锛屾暟鐮佺瑕佹樉�?虹殑灏辨槸杩欎釜鏁版�?
	 wire [3:0] shi,bai;
	 wire [3:0] membai,memshi,memge;
     reg [23:0]count;
     reg clk_s;
always @(posedge clk)begin
        if(count == 24'd25000)
           begin 
           clk_s=~clk_s; 
           count<=0 ;
           end
          else   
           begin count <= count+1;end
end

	 initial q=0;
assign	 ge = data%8'd10;
assign	 bai = data/8'd100;
assign   shi = (data/8'd10)%8'd10;
assign	 membai = mem /8'd100;
assign	 memshi = (mem/8'd10)%8'd10;
assign	 memge = mem%8'd10;
	 always @(posedge clk_s)  //鍔ㄦ�佹壂鎻忥紝浣块�夋嫨鍙�?噺闅忔椂閽熺殑鏉ュ埌鑰屾敼鍙橈紝浠庤�屼緷娆￠�夋嫨瑕佹樉绀虹殑鏁扮爜绠′互鍙婃暟鎹�?
		 q<=(1+q)%6;		
	 always @(*)
	 begin
		case(q)  
		3'b000:begin an=8'b11111110;d=memge;end
		3'b001:begin an=8'b11111101;d=memshi;end
		3'b010:begin an=8'b11111011; d=membai;end
		3'b011:begin an=8'b11011111;d=ge;end
		3'b100:begin an=8'b10111111;d=shi;end
		3'b101:begin an=8'b01111111;d=bai;end
		default:an=8'b11111111;//d=0;
		endcase
		/*case(q) 
		3'b000:an=8'b11111110; 
		3'b001:an=8'b11111101; 
		3'b010:an=8'b11111011; 
		3'b011:an=8'b11011111; 
		3'b100:an=8'b10111111; 
		3'b101:an=8'b01111111; 
		default an<=8'b11111111; 
		endcase*/
	 end
		 always@(d)  //涓冩鏁扮爜绠＄殑BCD璇戠�?
	 begin
		case(d)
	 4'b0000:seg7=7'b1000000;
	 4'b0001:seg7=7'b1111001;
	 4'b0010:seg7=7'b0100100;
	 4'b0011:seg7=7'b0110000;
	 4'b0100:seg7=7'b0011001;
	 4'b0101:seg7=7'b0010010;
	 4'b0110:seg7=7'b0000010;
	 4'b0111:seg7=7'b1111000;
	 4'b1000:seg7=7'b0000000;
	 4'b1001:seg7=7'b0010000;


	 default: seg7=7'b1000000;
		endcase
	 end

endmodule

////module seg7(
////    input wire clk,
////    input wire [7:0]accum,    //�ۼ���
////    input wire [7:0]data,   //������
////    output reg [6:0] seg7,
////    output reg [7:0] an
//////    output [1:0]test
////    );
////	 reg [2:0]q; //8λ��
////	 reg [4:0] d;//������
////	 reg [3:0] a2,a1,a0;
////	 reg [3:0] b2,b1,b0;

////	 initial q=0;
////	 always @(posedge clk)  //鍔ㄦ�佹壂鎻忥紝浣块�夋嫨鍙�?噺闅忔椂閽熺殑鏉ュ埌鑰屾敼鍙橈紝浠庤�屼緷娆￠�夋嫨瑕佹樉绀虹殑鏁扮爜绠′互鍙婃暟鎹�?
////		 q<=(1+q)%6;		
////	 always @(posedge clk)
////	 begin
////	    a2 = data/100;
////	    a1 = (data/10)%10;
////        a0 = data%10;
////	    b2 = accum /100;
////	    b1 = (accum/10)%10;
////	    b0 = accum%10;
////		case(q)  
////		3'b000:d=b0;
////		3'b001:d=b1;
////		3'b010:d=b2;
////		3'b011:d=a0;
////		3'b100:d=a1;
////		3'b101:d=a2;
////		default:d=0;
////		endcase
////		case(q) 
////		3'b000:an=8'b11111110; 
////		3'b001:an=8'b11111101; 
////		3'b010:an=8'b11111011; 
////		3'b011:an=8'b11011111; 
////		3'b100:an=8'b10111111; 
////		3'b101:an=8'b01111111; 
////		default an<=8'b11111111; 
////		endcase
////	 end
////		 always@(d)  
////	 begin
////		case(d)
////	 4'b0000:seg7=7'b1000000;
////	 4'b0001:seg7=7'b1111001;
////	 4'b0010:seg7=7'b0100100;
////	 4'b0011:seg7=7'b0110000;
////	 4'b0100:seg7=7'b0011001;
////	 4'b0101:seg7=7'b0010010;
////	 4'b0110:seg7=7'b0000010;
////	 4'b0111:seg7=7'b1111000;
////	 4'b1000:seg7=7'b0000000;
////	 4'b1001:seg7=7'b0010000;


////	 default: seg7=7'b1000000;
////		endcase
////	 end

////endmodule