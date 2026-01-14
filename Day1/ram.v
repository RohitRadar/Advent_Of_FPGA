`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.12.2025 18:53:57
// Design Name: 
// Module Name: ram
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


module ram(
    input signed [31:0]ip,
    input clk,rst,
    output reg [31:0]op
    );
    
    initial op<=0;
    reg signed [31:0]add=50;
    always @(posedge clk)
    begin
    if(rst)
    begin
        op<=0;
        add<=50;
    end
    else 
    begin
        if(-ip>add) add<=(100+(add+ip)%100)%100;
        else add<=(add+ip)%100;
        if((add+ip)%100==0)op<=op+1;
    end
    end
    
endmodule
