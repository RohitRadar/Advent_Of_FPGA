`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.01.2026 15:07:06
// Design Name: 
// Module Name: comparator2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module comparator2(
    input [43:0]ip,
    output reg op_eq
    );
    
    reg [3:0]length=0;
    integer i;
    always @(*)
    begin
        if (ip[43:40] != 4'd0) length = 11;
        else if (ip[39:36] != 4'd0) length = 10;
        else if (ip[35:32] != 4'd0) length = 9;
        else if (ip[31:28] != 4'd0) length = 8;
        else if (ip[27:24] != 4'd0) length = 7;
        else if (ip[23:20] != 4'd0) length = 6;
        else if (ip[19:16] != 4'd0) length = 5;
        else if (ip[15:12] != 4'd0) length = 4;
        else if (ip[11:8] != 4'd0) length = 3;
        else if (ip[7:4] != 4'd0) length = 2;
    end
    
    always @(*)
    begin
        case(length)
        2: 
        begin
            if (ip[3:0] == ip[7:4])op_eq = 1;
            else op_eq=0;
        end
        4: 
        begin
            if (ip[7:0] == ip[15:8])op_eq = 1;
            else op_eq=0;
        end
        6: 
        begin
            if (ip[11:0] == ip[23:12])op_eq = 1;
            else op_eq=0;
        end
        8: 
        begin
            if (ip[15:0] == ip[31:16])op_eq = 1;
            else op_eq=0;
        end
        10: 
        begin
            if (ip[19:0] == ip[39:20])op_eq = 1;
            else op_eq=0;
        end
        default: op_eq = 0;
        endcase
    end
    
endmodule
