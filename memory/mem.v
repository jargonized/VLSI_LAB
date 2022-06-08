`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.04.2022 14:58:32
// Design Name: 
// Module Name: mem
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


module mem(input [7:0] datain, input cs, clk, reset, p_p, output reg [7:0] dataout);

reg [7:0] memory [3:0];

integer i;
integer k = -1;

ila_1 dut1 (.clk(clk),
            .probe0(datain),
            .probe1(dataout),
            .probe2(reset),
            .probe3(p_p),
            .probe4(cs)
            );

always @ (posedge clk)
    if (!reset) begin
        for(i=0; i<32;i=i+1)
            memory[i] <= 0;
         end 
                   
         else begin
        if (cs & p_p & k<3)begin
            k = k+1;
            memory[k] <= datain;
            
        end else if (cs & ~p_p & k>=0) begin
            dataout <= memory[k];
            memory[k] <= 0;
            k = k-1;
            
            end
    end

  
endmodule
