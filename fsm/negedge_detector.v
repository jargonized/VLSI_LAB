`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2022 09:11:30 AM
// Design Name: 
// Module Name: negedge_detector
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


module negedge_detector(
    input I, reset, clk,
    output reg Y
    );
    
    parameter init_state = 4'b0001;
    parameter h_detected = 4'b0010;
    parameter h_to_l_detected = 4'b0100;
    parameter l_detected = 4'b1000;
    
    reg [3:0] present_state;
    reg [3:0] next_state;
    
    //State assignment step
    always @(posedge clk, posedge reset)
        begin
            if(reset == 1)  //Reset is active high
                present_state <= init_state;
            else
                present_state <= next_state;
        end
            
    //Next state finding combinational clk
    always @(*)
    begin
        case(present_state)
            init_state:
                next_state = (I==1) ? h_detected : l_detected;
               
            h_detected:
                next_state = (I==1) ? h_detected : h_to_l_detected;
                
            h_to_l_detected:
                next_state = (I==1) ? h_detected : l_detected;
                
            l_detected:
                next_state = (I==1) ? h_detected : l_detected;
                
            default:
                next_state = init_state;
        endcase
    end
    
    //Output clk
    always @(present_state)
        begin
            if(present_state == h_to_l_detected)
                Y = 1'b1;
            else
                Y = 1'b0; 
        end
        
endmodule
