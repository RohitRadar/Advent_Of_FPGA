`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.01.2026 10:08:15
// Design Name: 
// Module Name: Main2_tb
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


module Main2_tb();
    reg rst,clk;
    wire [31:0]sum;
    
    Main1 DUT(
        .clk(clk),
        .rst(rst),
        .sum(sum)
    );
    
    always #5 clk=~clk;
    
    initial 
    begin
        rst=0;clk=0;
        #1000;
        $finish;
    end

endmodule
