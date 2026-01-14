`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2026 08:00:18
// Design Name: 
// Module Name: main_tb
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


module main_tb();
    reg clk,rst,start;
    reg [3:0]ip;
    wire [59:0]ans;
    wire finish;
    
//    main_2digit DUT(
    main DUT(
        .clk(clk),
        .rst(rst),
        .start(start),
        .ip(ip),
        .ans(ans),
        .finish(finish)
    );

    always #5 clk=~clk;
    integer file,status,i;
    reg [100*8:0]line;
    initial 
    begin
        clk=0;rst=0;start=0;ip=0;
        file = $fopen("C:/Users/rohit/OneDrive/Desktop/Projects/jane_street/Day3/input.txt", "r");
        while (!$feof(file)) 
        begin
            status = $fgets(line, file);
            if (status>0) 
            begin
                start=1;#10;start=0;
                for (i=status-1;i>=0;i=i-1) begin
                    if (line[i*8+:7]>="0" && line[i*8+:7]<="9")
                    begin
                        ip = line[i*8 +: 8]-"0";#10;
                    end
                end
                while(!finish)#10;
            end
        end
        $finish;
    end
endmodule
