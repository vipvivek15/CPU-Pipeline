`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2021 11:00:18 AM
// Design Name: 
// Module Name: ifidbuff
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: IF/ID is a buffer between the IF and ID stages
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module iftoidbuff(clk, IFIDWrite, inst_in, pc_in,inst_out, pc_out);
input IFIDWrite;
input [31:0]inst_in;
input [31:0]pc_in;
output reg [31:0]inst_out;
output reg [31:0]pc_out;

input clk;

initial
begin
    inst_out = 0;
    pc_out = 0;
end

always@(posedge clk)
begin
    // only pass inputs to outputs if we are allowing IF/ID buffer to write, else hold current values
    if (IFIDWrite == 1)
    begin
        inst_out = inst_in;
        pc_out = pc_in;
    end     
end

endmodule
