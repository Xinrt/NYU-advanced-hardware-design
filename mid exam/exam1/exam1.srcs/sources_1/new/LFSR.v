`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/21 14:17:22
// Design Name: 
// Module Name: LFSR
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


module LFSR(
    input wire clk, en, rst,
    output wire [9:0] data
    );
    
    // N number: N10257233
    reg [9:0] i_data=10'b1000110011;
    
    reg T1=1'b0;
    reg T2=1'b0;
    reg T3=1'b0;
    
    always @(posedge clk or posedge rst or posedge en) begin
        if(en) begin
            if(rst==1) i_data<=10'b1000110011;
                else begin
                    // position 5, 2, 1, 0 are 4 taps 
                    T1=i_data[0] ^ i_data[1];
                    T2=T1 ^ i_data[2];
                    T3=T2 ^ i_data[5];
                    i_data={T3, i_data[9:1]};
                end
        end
    end
    assign data = i_data[9:0];
endmodule
