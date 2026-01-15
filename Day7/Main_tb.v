`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.01.2026 21:31:11
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


module Main_tb();
    reg clk,rst;
    wire [63:0]ans1,ans2;
    
    Main DUT(
        .clk(clk),
        .rst(rst),
        .ans1(ans1),
        .ans2(ans2)
    );
    
    always #5 clk=~clk;
    
    initial
    begin
        rst=0;clk=0;
        #1000;
        $finish;
    end
endmodule
