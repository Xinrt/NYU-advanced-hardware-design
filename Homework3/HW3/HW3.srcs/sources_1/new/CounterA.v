`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/12 21:16:05
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
    
    reg [15:0] i_counter=16'b0000000000000001;
    
    always @(posedge clk or posedge rst) begin
        if(cnt_en) begin
            if(rst==1) i_counter<=16'b0000000000000001;
                else begin
                    if(i_counter==16'b1111111111111111) i_counter<=16'b0000000000000001;
                    else i_counter<=i_counter+16'b1;
                end
        end
    end
    assign cnt = i_counter[15:0]; 
endmodule
