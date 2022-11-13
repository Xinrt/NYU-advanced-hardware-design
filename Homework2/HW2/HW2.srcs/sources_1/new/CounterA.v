`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/28 00:17:34
// Design Name: 
// Module Name: CounterA
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


module CounterA(
    input wire clk, rst, cnt_en,
    output wire [15:0] cnt
);
    
    reg [41:0] i_counter=42'b000000000000000100000000000000000000000000;
    
    always @(posedge clk or posedge rst) begin
        if(cnt_en) begin
            if(rst==1) i_counter<=42'b000000000000000100000000000000000000000000;
                else begin
                    if(i_counter==42'b111111111111111111111111111111111111111111) i_counter<=42'b000000000000000100000000000000000000000000;
                    else i_counter<=i_counter+42'b1;
                end
        end
    end
    assign cnt = i_counter[41:26];            
endmodule
