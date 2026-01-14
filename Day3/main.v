`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.01.2026 22:36:40
// Design Name: 
// Module Name: main
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


module main(
    input clk,rst,start,
    input [3:0]ip,
    output reg [59:0]ans,
    output reg finish
    );
    parameter [6:0]addr_max=100;
    
    reg [59:0]max=0,adder=0;
    reg [3:0]bram[addr_max-1:0];
    reg [6:0]addr=0,index=0,index_max=addr_max-12;
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
            index<=0;index_max<=addr_max-12;
            state<=0;
            finish<=1;
        end
        else 
        begin
            case(state)
            0:
            begin
                addr<=0;ans<=adder;max<=0;
                index<=0;index_max<=addr_max-12;
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
                    if(index_max>=99)state<=0;
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
    
    
    reg [15:0]c=0;
    genvar i;
    generate 
        for(i=1;i<16;i=i+1)
        begin:bcd_adder
            always @(*)
            begin
                if(rst) 
                begin
                    adder[4*i-1:4*(i-1)]=0;
                    c[i]=0;
                end
                else if(c[i-1]+max[4*i-1:4*(i-1)]+ans[4*i-1:4*(i-1)]>9)
                begin
                    adder[4*i-1:4*(i-1)]=c[i-1]+ans[4*i-1:4*(i-1)]+max[4*i-1:4*(i-1)]-10;
                    c[i]=1;
                end
                else
                begin
                    adder[4*i-1:4*(i-1)]=c[i-1]+ans[4*i-1:4*(i-1)]+max[4*i-1:4*(i-1)];
                    c[i]=0;
                end
            end
        end
    endgenerate
    
endmodule
