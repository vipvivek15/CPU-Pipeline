`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2019 05:39:02 PM
// Design Name: 
// Module Name: data
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: datamem.v represents the data memory unit module. It manages
//              the data memory inside based on given address and the input to the two
//              control selectors. Can write and read data. It is sequential module
//              and requires a clock.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module data(clock, memWrite, memRead, address, WD, RD);
//initialization of variables
input clock;
input memWrite; // control selector determining write to data operation
input memRead;  // control selector determining read from data operation

// 2-d array for internal data representation
reg [31:0] data[65535:0];

input [31:0] address;
input [31:0] WD; // write to data input

output reg [31:0] RD; // read from data output

//integer i;
//initial
//begin
//    for (i = 0; i < 65536; i = i + 1)
//    begin
//        data[i] = 0;
//    end
//end

// initial block, data[0-19] 20 random numbers
initial
begin
    data[0] = 20123;
    data[1] = 18833;
    data[2] = 39041;
    data[3] = -16424;
    data[4] = 36453;
    data[5] = 11705;
    data[6] = -49943;
    data[7] = 58324; // largest max number
    data[8] = -35654;
    data[9] = -37822;
    data[10] = -2700;
    data[11] = 2050;
    data[12] = 46716;
    data[13] = -40214;
    data[14] = -19144;
    data[15] = -26370;
    data[16] = -17979;
    data[17] = -26735;
    data[18] = -29557;
    data[19] = 14800;
end

// at positive edge of clock, update the output
always@(negedge clock)
begin
    // use address to index into the data memory to read the desired data if control selector is 1
    if (memRead == 1)
        RD = data[address[15:0]];
    // use address to index into the data memory to write the desired data if control selector is 1
    if (memWrite == 1)
        data[address[15:0]] = WD;
end
endmodule