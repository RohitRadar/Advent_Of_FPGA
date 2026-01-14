`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.12.2025 11:39:26
// Design Name: 
// Module Name: ram2
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


module ram2(
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
        if(ip>=0) op<=op+(add+ip)/100;
        else 
        begin
            if(add!=0)op<=op+(100-add-ip)/100;
            else op<=op+(0-ip)/100;
        end
    end
    end
endmodule
