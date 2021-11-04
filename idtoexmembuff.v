`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2021 11:04:53 AM
// Design Name: 
// Module Name: idtoexmembuff
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: ID/EXandMEM is buffer between the ID and EXandMEM stages
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module idtoexmembuff(clk, op_in, Jm_in, RegWrt_in, ALUtoReg_in, MemWrite_in, MemRead_in, CONST_in, ALUOp_in, PCtoALU_in, PC_in, xrs_in, xrt_in, const_in, rs_in, rt_in, rd_in,
      op_out,Jm_out, RegWrt_out, ALUtoReg_out, MemWrite_out, MemRead_out, CONST_out, ALUOp_out, PCtoALU_out, PC_out, xrs_out, xrt_out, const_out, rs_out, rt_out, rd_out);

input RegWrt_in, ALUtoReg_in, MemWrite_in, MemRead_in, CONST_in, PCtoALU_in, Jm_in;
input [2:0]ALUOp_in;
input [31:0] PC_in, xrs_in, xrt_in, const_in;
input [5:0] rs_in, rt_in, rd_in;
input clk;


output reg RegWrt_out, ALUtoReg_out, MemWrite_out, MemRead_out, CONST_out, PCtoALU_out, Jm_out;
output reg [2:0]ALUOp_out;
output reg [31:0] xrs_out, xrt_out, const_out, PC_out;
output reg [5:0] rs_out, rt_out, rd_out;

input [3:0] op_in;
output reg [3:0] op_out;

initial
begin
    RegWrt_out = 0;
    ALUtoReg_out = 0;
    Jm_out = 0;
    
    MemWrite_out = 0;
    MemRead_out = 0;

    ALUOp_out = 0;
    PC_out = 0;
    const_out = 0;
    
    CONST_out = 0; 
    PCtoALU_out = 0;
    
    xrs_out = 0;
    xrt_out = 0;

    rs_out = 0; 
    rt_out = 0;
    rd_out = 0;
end

always@(posedge clk)
begin
    // WB stage
    RegWrt_out = RegWrt_in;
    ALUtoReg_out = ALUtoReg_in;
    Jm_out = Jm_in;
    
    // EXandMEM stage
    MemWrite_out = MemWrite_in; 
    MemRead_out = MemRead_in;

    ALUOp_out = ALUOp_in;
    PC_out = PC_in;
    const_out = const_in; 
    
    CONST_out = CONST_in; 
    PCtoALU_out = PCtoALU_in;
    
    // reg file outputs
    xrs_out = xrs_in; 
    xrt_out = xrt_in; 

    // register addresses for forwarding unit
    rs_out = rs_in; 
    rt_out = rt_in;
    rd_out = rd_in;
    
    op_out = op_in;
end

endmodule
