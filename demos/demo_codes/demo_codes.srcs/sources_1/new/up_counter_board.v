`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/20 23:16:19
// Design Name: 
// Module Name: up_counter_board
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


module up_counter_board(
    input wire CLK100MHZ,
    input wire [15:0] sw,
    output wire [15:0] LED 
    );
    
    up_counter_verilog design_counterA(
        .clk(CLK100MHZ),
        .rst(sw[0]),
        .cnt_en(sw[1]),
        .cnt(LED)
    );
endmodule
