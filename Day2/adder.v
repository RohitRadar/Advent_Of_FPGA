`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.12.2025 19:03:38
// Design Name: 
// Module Name: adder
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


module adder(
    input rst,
    input [43:0]ip1,ip2,
    output reg [43:0]op
    );
    
    reg [11:0]c=0;
    initial op=0;
    genvar i;
    generate 
        for(i=1;i<12;i=i+1)
        begin:adder
            always @(*)
            begin
                if(rst) 
                begin
                    op[4*i-1:4*(i-1)]=0;
                    c[i]=0;
                end
                else if(c[i-1]+ip1[4*i-1:4*(i-1)]+ip2[4*i-1:4*(i-1)]>9)
                begin
                    op[4*i-1:4*(i-1)]=c[i-1]+ip1[4*i-1:4*(i-1)]+ip2[4*i-1:4*(i-1)]-10;
                    c[i]=1;
                end
                else
                begin
                    op[4*i-1:4*(i-1)]=c[i-1]+ip1[4*i-1:4*(i-1)]+ip2[4*i-1:4*(i-1)];
                    c[i]=0;
                end
            end
        end
    endgenerate
    
endmodule
