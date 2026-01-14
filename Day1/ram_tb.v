`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.12.2025 19:28:26
// Design Name: 
// Module Name: ram_tb
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


module ram_tb();
    reg clk,rst;
    reg signed [31:0]ip;
    wire signed [31:0]op;
    
    ram2 DUT(
        .clk(clk),
        .rst(rst),
        .ip(ip),
        .op(op)
    );
    
    always #5 clk<=~clk;
    integer file,status,value;
    reg [7:0]dir;
    reg [8*4-1:0] line; 
    initial
    begin
        clk=0;ip=0;rst=0;#10;
        file = $fopen("C:/Users/rohit/OneDrive/Desktop/Projects/jane_street/Day1/input.txt", "r");
        while (!$feof(file)) 
        begin
            status = $fgets(line, file);
            if (status > 0) 
            begin
                if ($sscanf(line, "%c%d", dir, value) == 2) 
                begin
                    if (dir=="R")ip=value;
                    else ip=-value;
                    #10;
                end
            end
        end
        $finish;
    end
endmodule
