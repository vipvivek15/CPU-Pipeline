`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2021 05:57:17 PM
// Design Name: 
// Module Name: Forwarding_final
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Forwarding for final project
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Forwarding_final(op, Rd,Rs,Rt,PCtoALU, Const, RegWrt, Mux1,Mux2);
input [3:0]op;
input [5:0] Rd; //6 bit Rd in the ID/EX
input [5:0] Rs; //6 bit Rs in the EX/MEM
input [5:0] Rt; //6 bit Rt in the MEM/WB
input PCtoALU; //PCtoALU input
input Const; //Const input
input RegWrt; //regwrt input
output reg[1:0] Mux1; //mux1 output
output reg[1:0] Mux2; //mux2 output

initial
begin
    Mux1 = 0;
    Mux2 = 0;
end

always@(op, Rd, Rs, Rt, RegWrt, Const, PCtoALU)
begin
    // rd is 0, then ignore dependency/hazard since it is the 0 register
    if (Rd == 0)
    begin
        Mux1 = PCtoALU;
        Mux2 = Const;
    end
    // no dependency for incrementing a counter to access data members
    else if (op == 4'b0101)
    begin
        Mux1 = PCtoALU;
        Mux2 = Const;
    end
    else
    begin
        //no data dependencies or not writing anything to rd
        if((Rd!=Rs && Rd!=Rt) || RegWrt == 0)
        begin 
            Mux1 = PCtoALU;
            Mux2 = Const;
        end
        else
        begin
    
            // data dependency for first mux input into ALU
            // RAW Hazard detected for the first mux into ALU
            if(Rd==Rs && RegWrt==1 && PCtoALU == 0) 
            begin
                Mux1 = 2;
            end
            else
                Mux1 = PCtoALU;
        
            // data dependency for second mux input into ALU
            // RAW Hazard detected for the second mux into ALU
            if(Rd==Rt && RegWrt==1 && Const == 0)
            begin
                Mux2 = 2;
            end
            else
                Mux2 = Const;
        end        
    end
end

endmodule
