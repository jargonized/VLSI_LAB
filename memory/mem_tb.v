`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.04.2022 15:07:44
// Design Name: 
// Module Name: mem_tb
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


module mem_tb();

reg [7:0] datain;
wire [7:0] dataout;
reg clk, reset, cs, p_p;




mem dut (.cs(cs), .clk(clk), .reset(reset), .datain(datain), .dataout(dataout), .p_p(p_p));

always #5 clk = ~clk;

initial begin

clk <= 1'b0;
reset <= 1'b0;
cs <= 1;


#6 reset <= 1'b1;
#6 p_p <= 1'b1;
datain <= 8'b00001111;
#10 datain <= 8'b00001011;
#8 p_p <= 1'b0;
#10 datain <= 8'b01001011;
#8 p_p <= 1'b1;
#10 datain <= 8'b00101011;
#10 datain <= 8'b10001011;
#10 datain <= 8'b00001011;
#8 p_p <= 1'b0;

end

endmodule
