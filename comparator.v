`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2021 05:06:22 PM
// Design Name: 
// Module Name: comparator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: comparator takes to values, a and b, and compares them to see
//              if they are equal
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module comparator(a,b,equal);
input [31:0] a, b;
output reg equal;

always@(a,b)
begin
    if (a == b)
    begin
        equal = 1;
    end
    else
    begin
        equal = 0;
    end
end

endmodule
