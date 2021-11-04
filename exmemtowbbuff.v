`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2021 01:02:33 PM
// Design Name: 
// Module Name: exmemtowbbuff
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: EXandMEM/WB is a buffer between the EXandMEM and WB stages
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module exmemtowbbuff(clk, Jm_in, RegWrt_in, ALUtoReg_in, mem_res_in, alu_res_in, rd_in, Jm_out, RegWrt_out, ALUtoReg_out, mem_res_out, alu_res_out, rd_out);

input Jm_in, RegWrt_in, ALUtoReg_in;
input [31:0] mem_res_in, alu_res_in;
input [5:0] rd_in;
input clk;

output reg Jm_out, RegWrt_out, ALUtoReg_out;
output reg [31:0] mem_res_out, alu_res_out;
output reg [5:0] rd_out;

initial
begin
    RegWrt_out = 0;
    ALUtoReg_out = 0;
    Jm_out = 0;
    
    mem_res_out = 0;
    alu_res_out = 0;

    rd_out = 0;
end

always@(posedge clk)
begin
    //WB Stage
    Jm_out = Jm_in;
    RegWrt_out = RegWrt_in;
    ALUtoReg_out = ALUtoReg_in;
    
    // Results from ALU output and Memory Read Data
    mem_res_out = mem_res_in;
    alu_res_out = alu_res_in;
    
    // Write register address
    rd_out = rd_in;
end

endmodule
