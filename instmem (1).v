`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2021 02:26:24 PM
// Design Name: 
// Module Name: instmem
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: instmem.v represents the instruction memory unit module. Given
//              an address, it outputs the instructions. It is sequential module
//              and requires a clock.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module instmem(clock, address, inst);
//initialization of variables
input clock;
input [31:0]address;
output reg [31:0]inst;

// 2-d array for instructions inside the module
wire[31:0] instr[255:0];

//manually assigning values for Basic Pipelin testing -- includes nops
////assign instr[0] = 32'b01110001000001000001000000000000;  //sub x4,x4,x4
////assign instr[1] = 32'b01010001000001001000000000000000;  //inc x4,x4,-32
//assign instr[0] = 32'b01000001010000100000110000000000;  //add x5,x2,x3
////assign instr[1] = 32'b11110010010000010000000000000000;  //x9 = PC+1
////assign instr[2] = 32'b11110010100001000000000000000000;  //x10 = PC+4
//assign instr[1] = 32'b11100001100000100000000000000000;  // x6 = mem[x2]
//assign instr[2] = 32'b00000000000000000000000000000000;  // nop
//assign instr[3] = 32'b00000000000000000000000000000000;  // nop
//assign instr[4] = 32'b01110001110001100001000000000000;  // sub x7,x6,x4
//assign instr[5] = 32'b10110000000010100000000000000000;  // BRN x10
//assign instr[6] = 32'b00000000000000000000000000000000;  // nop
//assign instr[7] = 32'b00000000000000000000000000000000;  // nop
//assign instr[8] = 32'b01000001000001100000010000000000;  // add x4,x6,x1; x1 = 0
//assign instr[9] = 32'b01010000100000100000010000000000;  // inc x2,x2,1
//assign instr[10] = 32'b01110010000000100001010000000000;  // sub x8,x2,x5 index - 19
//assign instr[11] = 32'b10110000000010010000000000000000;  // BRN x9
//assign instr[12] = 32'b00000000000000000000000000000000; // nop

//manually assigning values for Advanced Pipeline testing - has no nops due to advanced hazard handling
assign instr[0] = 32'b01000001010000100000110000000000;  //add x5,x2,x3
assign instr[1] = 32'b11100001100000100000000000000000;  // x6 = mem[x2]
assign instr[4] = 32'b01110001110001100001000000000000;  // sub x7,x6,x4
assign instr[5] = 32'b10110000000010100000000000000000;  // BRN x10
assign instr[8] = 32'b01000001000001100000010000000000;  // add x4,x6,x1; x1 = 0
assign instr[9] = 32'b01010000100000100000010000000000;  // inc x2,x2,1
assign instr[10] = 32'b01110010000000100001010000000000;  // sub x8,x2,x5 index - 19
assign instr[11] = 32'b10110000000010010000000000000000;  // BRN x9

// manually initializing for MAX instruction test
//assign instr[0] = 32'b00000000000000000000000000000000;  // nop
//assign instr[1] = 32'b00000000000000000000000000000000;  // nop
//assign instr[2] = 32'b00010001000000100000110000000000; // MAX inst

// on positive edge of clock will consume an address and outputs the instructions at that address
always@(negedge clock)
begin
    inst = instr[address];
end
endmodule
