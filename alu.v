`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2021 05:38:08 PM
// Design Name: 
// Module Name: ALU_final
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Final ALU for datapath
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu(A,B,Op,Out,Z,N);

input [31:0] A; //32 bit input
input [31:0] B; //32 bit input
input [2:0] Op; //3 bit operation
output reg [31:0] Out; //32 bit output
output reg Z; //zero flag
output reg N; //negative flag

always@(A,B,Op) //check conditions in always block
begin
    case(Op)
        3'b001: Out = B+(((~A)+1)); //B-A
        3'b010: Out = (~B)+1; //-B
        3'b100: Out = B+A; //B+A
        3'b111: Out = A; //A
    endcase
end

always@(Out)
begin
    Z=0;
    if(Out==0) //if out==0, set zero flag to 1
        Z=1;
    N=0;
    if(Out[31]==1) //if the most significant bit is 1, set negative flag to 1
        N=1;
end

endmodule
