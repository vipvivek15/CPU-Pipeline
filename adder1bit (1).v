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
// Description: adder1bit.v adds two single bits together and takes into account
//              carry-ins and carry-overs
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module adder1bit(A,B,c_in,c_out,sum);
input A, B, c_in;
output sum, c_out;

assign sum = A ^ B ^ c_in;
assign c_out =  (A & B) | (A & c_in) | (B & c_in);

endmodule
