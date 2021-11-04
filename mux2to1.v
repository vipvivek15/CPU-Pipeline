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
// Description: 2to1mux.v represents a mux with 2 32-bit bus inputs and a 1-bit
//              selector that chooses one of the inputs to move to output
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module mux2to1(w0, w1, s, out);
input [31:0]w0;
input [31:0]w1;
input s;
output [31:0]out;

assign out = s ? w1 : w0;

endmodule