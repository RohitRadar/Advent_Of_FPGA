`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.12.2025 16:45:16
// Design Name: 
// Module Name: design_tb
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


module design_tb();
    reg clk,rst,new_ip;
    reg [43:0]ip1,ip2;
    wire [43:0]sum;
    wire new;

    bcd_counter DUT(
        .clk(clk),
        .rst(rst),
        .new_ip(new_ip),
        .ip1(ip1),
        .ip2(ip2),
        .sum(sum),
        .new(new)
    );
    
    always #5 clk=~clk;
    
    initial
    begin
        clk=0;rst=0;
        
        new_ip=1;
        ip1={4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd1,4'd9,4'd3,4'd9,4'd1};
        ip2={4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd4,4'd7,4'd3,4'd5,4'd3};
        #20;new_ip=0;
        while(new==0)#10;
        
        new_ip=1;
        ip1={4'd0,4'd0,4'd0,4'd0,4'd9,4'd3,4'd5,4'd4,4'd3,4'd5,4'd7};
        ip2={4'd0,4'd0,4'd0,4'd0,4'd9,4'd4,4'd3,4'd4,4'd5,4'd5,4'd8};
        #20;new_ip=0;
        while(new==0)#10;
        
        new_ip=1;
        ip1={4'd0,4'd4,4'd6,4'd4,4'd6,4'd4,4'd2,4'd7,4'd5,4'd3,4'd8};
        ip2={4'd0,4'd4,4'd6,4'd4,4'd6,4'd4,4'd9,4'd7,4'd4,4'd3,4'd3};
        #20;new_ip=0;
        while(new==0)#10;
        
        new_ip=1;
        ip1={4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd2,4'd7,4'd3};
        ip2={4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd8,4'd3,4'd0};
        #20;new_ip=0;
        while(new==0)#10;
        
        new_ip=1;
        ip1={4'd0,4'd0,4'd0,4'd0,4'd0,4'd6,4'd1,4'd2,4'd6,4'd5,4'd8};
        ip2={4'd0,4'd0,4'd0,4'd0,4'd0,4'd6,4'd7,4'd4,4'd9,4'd2,4'd5};
        #20;new_ip=0;
        while(new==0)#10;
        
        new_ip=1;
        ip1={4'd0,4'd0,4'd0,4'd0,4'd6,4'd6,4'd3,4'd9,4'd0,4'd1,4'd1};
        ip2={4'd0,4'd0,4'd0,4'd0,4'd6,4'd6,4'd9,4'd9,4'd7,4'd7,4'd3};
        #20;new_ip=0;
        while(new==0)#10;
        
        new_ip=1;
        ip1={4'd0,4'd0,4'd0,4'd0,4'd4,4'd4,4'd2,4'd6,4'd3,4'd8,4'd4};
        ip2={4'd0,4'd0,4'd0,4'd0,4'd4,4'd4,4'd6,4'd3,4'd0,4'd9,4'd5};
        #20;new_ip=0;
        while(new==0)#10;
        
        new_ip=1;
        ip1={4'd0,4'd0,4'd5,4'd2,4'd7,4'd4,4'd9,4'd5,4'd3,4'd5,4'd6};
        ip2={4'd0,4'd0,4'd5,4'd2,4'd7,4'd5,4'd7,4'd5,4'd0,4'd9,4'd7};
        #20;new_ip=0;
        while(new==0)#10;
        
        new_ip=1;
        ip1={4'd0,4'd0,4'd0,4'd2,4'd2,4'd3,4'd2,4'd3,4'd2,4'd5,4'd8};
        ip2={4'd0,4'd0,4'd0,4'd2,4'd2,4'd4,4'd2,4'd2,4'd3,4'd9,4'd6};
        #20;new_ip=0;
        while(new==0)#10;
        
        new_ip=1;
        ip1={4'd0,4'd0,4'd0,4'd0,4'd0,4'd4,4'd1,4'd2,4'd1,4'd7,4'd5};
        ip2={4'd0,4'd0,4'd0,4'd0,4'd0,4'd4,4'd3,4'd1,4'd6,4'd2,4'd2};
        #20;new_ip=0;
        while(new==0)#10;
        
        new_ip=1;
        ip1={4'd0,4'd0,4'd0,4'd0,4'd0,4'd4,4'd9,4'd2,4'd5,4'd2,4'd4};
        ip2={4'd0,4'd0,4'd0,4'd0,4'd0,4'd6,4'd1,4'd1,4'd1,4'd1,4'd4};
        #20;new_ip=0;
        while(new==0)#10;
        
        new_ip=1;
        ip1={4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd7,4'd7};
        ip2={4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd1,4'd2,4'd2};
        #20;new_ip=0;
        while(new==0)#10;
        
        new_ip=1;
        ip1={4'd0,4'd0,4'd9,4'd9,4'd2,4'd9,4'd6,4'd4,4'd8,4'd4,4'd6};
        ip2={4'd0,4'd0,4'd9,4'd9,4'd3,4'd0,4'd2,4'd9,4'd7,4'd7,4'd6};
        #20;new_ip=0;
        while(new==0)#10;
        
        new_ip=1;
        ip1={4'd0,4'd0,4'd0,4'd0,4'd0,4'd1,4'd6,4'd5,4'd0,4'd8,4'd1};
        ip2={4'd0,4'd0,4'd0,4'd0,4'd0,4'd3,4'd3,4'd8,4'd9,4'd6,4'd2};
        #20;new_ip=0;
        while(new==0)#10;
        
        new_ip=1;
        ip1={4'd0,4'd0,4'd0,4'd0,4'd0,4'd9,4'd2,4'd5,4'd9,4'd6,4'd1};
        ip2={4'd0,4'd0,4'd0,4'd0,4'd0,4'd9,4'd9,4'd4,4'd1,4'd1,4'd3};
        #20;new_ip=0;
        while(new==0)#10;
        
        new_ip=1;
        ip1={4'd0,4'd7,4'd9,4'd6,4'd7,4'd1,4'd5,4'd3,4'd6,4'd1,4'd7};
        ip2={4'd0,4'd7,4'd9,4'd6,4'd7,4'd2,4'd3,4'd1,4'd7,4'd9,4'd9};
        #20;new_ip=0;
        while(new==0)#10;
        
        new_ip=1;
        ip1={4'd0,4'd0,4'd0,4'd7,4'd1,4'd5,4'd1,4'd8,4'd0,4'd5,4'd8};
        ip2={4'd0,4'd0,4'd0,4'd7,4'd1,4'd5,4'd4,4'd2,4'd4,4'd3,4'd4};
        #20;new_ip=0;
        while(new==0)#10;
        
        new_ip=1;
        ip1={4'd0,4'd0,4'd0,4'd6,4'd4,4'd1,4'd6,4'd4,4'd8,4'd3,4'd6};
        ip2={4'd0,4'd0,4'd0,4'd6,4'd4,4'd2,4'd9,4'd2,4'd0,4'd6,4'd6};
        #20;new_ip=0;
        while(new==0)#10;
        
        new_ip=1;
        ip1={4'd0,4'd0,4'd0,4'd0,4'd4,4'd4,4'd9,4'd5,4'd5,4'd8,4'd6};
        ip2={4'd0,4'd0,4'd0,4'd0,4'd4,4'd6,4'd5,4'd5,4'd0,4'd8,4'd3};
        #20;new_ip=0;
        while(new==0)#10;
        
        new_ip=1;
        ip1={4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd2};
        ip2={4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd1,4'd7};
        #20;new_ip=0;
        while(new==0)#10;
        
        new_ip=1;
        ip1={4'd0,4'd0,4'd0,4'd0,4'd0,4'd4,4'd3,4'd2,4'd1,4'd3,4'd9};
        ip2={4'd0,4'd0,4'd0,4'd0,4'd0,4'd4,4'd5,4'd4,4'd9,4'd6,4'd0};
        #20;new_ip=0;
        while(new==0)#10;
        
        new_ip=1;
        ip1={4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd4,4'd6,4'd4,4'd5};
        ip2={4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd1,4'd4,4'd0,4'd6,4'd6};
        #20;new_ip=0;
        while(new==0)#10;
        
        new_ip=1;
        ip1={4'd0,4'd0,4'd0,4'd0,4'd6,4'd0,4'd7,4'd3,4'd8,4'd7,4'd2};
        ip2={4'd0,4'd0,4'd0,4'd0,4'd6,4'd2,4'd3,4'd2,4'd0,4'd5,4'd8};
        #20;new_ip=0;
        while(new==0)#10;
        
        new_ip=1;
        ip1={4'd0,4'd9,4'd9,4'd9,4'd9,4'd9,4'd8,4'd4,4'd0,4'd2,4'd1};
        ip2={4'd1,4'd0,4'd0,4'd0,4'd0,4'd0,4'd1,4'd7,4'd9,4'd2,4'd9};
        #20;new_ip=0;
        while(new==0)#10;
        
        new_ip=1;
        ip1={4'd0,4'd0,4'd0,4'd0,4'd0,4'd7,4'd0,4'd4,4'd2,4'd1,4'd6};
        ip2={4'd0,4'd0,4'd0,4'd0,4'd0,4'd9,4'd0,4'd9,4'd3,4'd7,4'd4};
        #20;new_ip=0;
        while(new==0)#10;
        
        new_ip=1;
        ip1={4'd0,4'd0,4'd0,4'd4,4'd8,4'd4,4'd2,4'd5,4'd9,4'd2,4'd9};
        ip2={4'd0,4'd0,4'd0,4'd4,4'd8,4'd5,4'd4,4'd3,4'd9,4'd6,4'd3};
        #20;new_ip=0;
        while(new==0)#10;
        
        new_ip=1;
        ip1={4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd5,4'd2,4'd7,4'd6,4'd7};
        ip2={4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd9,4'd4,4'd1,4'd5,4'd6};
        #20;new_ip=0;
        while(new==0)#10;
        
        new_ip=1;
        ip1={4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd2,4'd6};
        ip2={4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd7,4'd6};
        #20;new_ip=0;
        while(new==0)#10;
        
        new_ip=1;
        ip1={4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd1,4'd2,4'd5,4'd2};
        ip2={4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd3,4'd9,4'd1,4'd9};
        #20;new_ip=0;
        while(new==0)#10;
        
        new_ip=1;
        ip1={4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd1,4'd2,4'd3};
        ip2={4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd0,4'd2,4'd2,4'd8};
        #20;new_ip=0;
        while(new==0)#10;

        $finish;
    end

endmodule
