`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2026 22:22:20
// Design Name: 
// Module Name: main_2digit
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


module main_2digit(
    input clk,rst,start,
    input [3:0]ip,
    output reg [59:0]ans,
    output reg finish
    );
    parameter [6:0]addr_max=100;
    
    reg [7:0]max=0;
    reg [3:0]bram[addr_max-1:0];
    reg [6:0]addr=0,index=0,index_max=addr_max-2;
    reg [3:0]state=0;
    initial
    begin
        ans=0;
        finish=1;
    end
    always @(posedge clk)
    begin
        if(rst)
        begin
            addr<=0;ans<=0;max<=0;
            index<=0;index_max<=addr_max-2;
            state<=0;
            finish<=1;
        end
        else 
        begin
            case(state)
            0:
            begin
                addr<=0;max<=0;
                index<=0;index_max<=addr_max-2;
                if(start)
                begin
                    finish<=0;
                    state<=1;
                end
                else finish<=1;
            end
            1:
            begin
                if(addr>=addr_max)
                begin
                    state<=2;
                    addr<=0;
                end
                else 
                begin
                    bram[addr]<=ip;
                    addr<=addr+1;
                end
            end
            2:
            begin
                if(addr<=index_max) 
                begin
                    if(bram[addr]>max[3:0])
                    begin
                        index<=addr;    
                        max[3:0]<=bram[addr];
                    end
                    addr<=addr+1;
                end
                else
                begin
                    addr<=index+1;
                    if(index_max>=99)
                    begin
                        state<=0;
                        ans<=ans+10*max[7:4]+max[3:0];
                    end
                    else 
                    begin
                        index_max<=index_max+1;       
                        max<=max<<4;
                    end
                end
            end
            endcase        
        end   
    end
    
endmodule
