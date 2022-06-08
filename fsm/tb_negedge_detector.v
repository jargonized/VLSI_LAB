`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2022 10:19:53 AM
// Design Name: 
// Module Name: tb_negedge_detector
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


module tb_negedge_detector;

reg I;
reg reset = 1'b1;
reg clk = 1'b0;
wire Y;
wire [3:0] present_state;

always #5 clk = ~clk;

initial #10 reset = 1'b0;

initial
    begin
        I = 1'b1;
        
        #3 I = 1'b0;
        #5 I = 1'b1;
        
        #25 I = 1'b1;
        
        #20 I = 1'b0;
        
        #20 I = 1'b1;
        
        #20 I = 1'b0;
    end
    
    negedge_detector DUT(.I(I), .reset(reset), .clk(clk), .Y(Y));
    assign present_state = DUT.present_state;
endmodule
