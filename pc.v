`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2021 02:56:09 PM
// Design Name: 
// Module Name: pc
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: PC is the program counter for the CPU that keeps track of the
//              current index for the next instruction to call in the
//              instruction memory unit.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pc(clock, PCWrite, pc_in, pc_out);
input PCWrite;
input [31:0]pc_in;
output reg [31:0]pc_out;
input clock;

initial
begin
    pc_out = 0;
end

always@(negedge clock)
begin
    // only pass inputs to outputs if we are allowing PC to write, else hold current values
    if (PCWrite == 1)
    begin
        if (pc_in) 
        begin
            pc_out = pc_in;
        end
    end
end

endmodule
