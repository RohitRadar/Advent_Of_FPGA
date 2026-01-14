`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.12.2025 16:21:46
// Design Name: 
// Module Name: bcd_counter
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


module bcd_counter(
    input clk,rst,new_ip,
    input [43:0]ip1,ip2,
    output wire [43:0]sum,
    output reg new
    );
    
    wire op_eq;
    reg [43:0]op=0,ip_add1=0,ip_add2=0;
//    comparator comp(
//        .ip(op),
//        .op_eq(op_eq)
//    );
    comparator2 comp1(
        .ip(op),
        .op_eq(op_eq)
    );
    adder add1(
        .rst(rst),
        .ip1(ip_add1),
        .ip2(ip_add2),
        .op(sum)
    );
    
    always @(posedge clk)
    begin
        if(op_eq && !new_ip)
        begin
            ip_add1<=op;
            ip_add2<=sum;
        end
    end
    
    initial new=1;
    always @(posedge clk)
    begin
        if(rst)
        begin
            op[3:0]<=0;
            new=1;
        end
        else if(op==ip2)new<=1;
        else if(new_ip)
        begin
            op[3:0]<=ip1[3:0];
            new<=0;
        end
        else
        begin
            if(op[3:0]!=9)op[3:0]<=op[3:0]+1;
            else op[3:0]<=0;
        end
    end
    
    genvar i;
    generate
        for(i=1;i<11;i=i+1)
        begin: bcd
            always @(posedge clk)
            begin
                if(rst)op[4*(i+1)-1:4*i]<=0;
                else if(new_ip)op[4*(i+1)-1:4*i]<=ip1[4*(i+1)-1:4*i];
                else
                begin
                    if(op[4*i-1:0]=={i{4'b1001}} && op<ip2)
                    begin
                        if(op[4*(i+1)-1:4*i]==9)op[4*(i+1)-1:4*i]<=0;
                        else op[4*(i+1)-1:4*i]<=op[4*(i+1)-1:4*i]+1;
                    end
                end
            end
        end
    endgenerate
endmodule
