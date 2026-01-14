`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2026 17:07:43
// Design Name: 
// Module Name: Main_tb
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

module Main1_tb();
    reg rst;
    wire [31:0]sum;

    Main1 DUT(
        .rst(rst),
        .sum(sum)
    );
    
    initial 
    begin
        rst=0;
        #10;
        $finish;
    end

endmodule
