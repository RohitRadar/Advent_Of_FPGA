`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.01.2026 22:04:11
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
    reg clk,rst;
    wire [63:0]ans;
    
    parameter size=194;
    Main2 DUT(
        .clk(clk),
        .rst(rst),
        .ans(ans)
    );
    
    always #5 clk=~clk;
    
    initial
    begin
        clk=0;rst=0;
        #(5*size*10);
        $finish;
    end

endmodule
