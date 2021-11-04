`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2021 01:34:03 PM
// Design Name: 
// Module Name: adder1bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: adder32.v takes two 32-bit buses as inputs and does a bit-by-bit
//              addition where the output is a 32-bit bus representing the sum
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module adder32bit(A,B,out);
input [31:0]A;
input [31:0]B;
output [31:0]out;

reg c_in = 0;     // c_in for starting carry-in value
wire [31:0]c_out; //c_out for carry-outs that input into next operation via next carry-in

// one bit at a time addition between the two 32-bit bus inputs
adder1bit submodule1(A[0], B[0], c_in, c_out[0], out[0]);
adder1bit submodule2(A[1], B[1], c_out[0], c_out[1], out[1]);
adder1bit submodule3(A[2], B[2], c_out[1], c_out[2], out[2]);
adder1bit submodule4(A[3], B[3], c_out[2], c_out[3], out[3]);
adder1bit submodule5(A[4], B[4], c_out[3], c_out[4], out[4]);
adder1bit submodule6(A[5], B[5], c_out[4], c_out[5], out[5]);
adder1bit submodule7(A[6], B[6], c_out[5], c_out[6], out[6]);
adder1bit submodule8(A[7], B[7], c_out[6], c_out[7], out[7]);
adder1bit submodule9(A[8], B[8], c_out[7], c_out[8], out[8]);
adder1bit submodule10(A[9], B[9], c_out[8], c_out[9], out[9]);
adder1bit submodule11(A[10], B[10], c_out[9], c_out[10], out[10]);
adder1bit submodule12(A[11], B[11], c_out[10], c_out[11], out[11]);
adder1bit submodule13(A[12], B[12], c_out[11], c_out[12], out[12]);
adder1bit submodule14(A[13], B[13], c_out[12], c_out[13], out[13]);
adder1bit submodule15(A[14], B[14], c_out[13], c_out[14], out[14]);
adder1bit submodule16(A[15], B[15], c_out[14], c_out[15], out[15]);
adder1bit submodule17(A[16], B[16], c_out[15], c_out[16], out[16]);
adder1bit submodule18(A[17], B[17], c_out[16], c_out[17], out[17]);
adder1bit submodule19(A[18], B[18], c_out[17], c_out[18], out[18]);
adder1bit submodule20(A[19], B[19], c_out[18], c_out[19], out[19]);
adder1bit submodule21(A[20], B[20], c_out[19], c_out[20], out[20]);
adder1bit submodule22(A[21], B[21], c_out[20], c_out[21], out[21]);
adder1bit submodule23(A[22], B[22], c_out[21], c_out[22], out[22]);
adder1bit submodule24(A[23], B[23], c_out[22], c_out[23], out[23]);
adder1bit submodule25(A[24], B[24], c_out[23], c_out[24], out[24]);
adder1bit submodule26(A[25], B[25], c_out[24], c_out[25], out[25]);
adder1bit submodule27(A[26], B[26], c_out[25], c_out[26], out[26]);
adder1bit submodule28(A[27], B[27], c_out[26], c_out[27], out[27]);
adder1bit submodule29(A[28], B[28], c_out[27], c_out[28], out[28]);
adder1bit submodule30(A[29], B[29], c_out[28], c_out[29], out[29]);
adder1bit submodule31(A[30], B[20], c_out[29], c_out[30], out[30]);
adder1bit submodule32(A[31], B[31], c_out[30], c_out[31], out[31]);

endmodule