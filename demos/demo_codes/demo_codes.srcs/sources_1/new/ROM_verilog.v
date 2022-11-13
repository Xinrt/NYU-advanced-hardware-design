`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/21 00:08:46
// Design Name: 
// Module Name: ROM_verilog
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


module ROM_verilog(
    input wire clk,
    input wire [3:0] addr,
    output reg [3:0] data
    );
    
reg [3:0] rom [0:15];

initial begin
    rom[0] = 4'b0000;
    rom[1] = 4'b0110;
    // etc...
    rom[31] = 4'b1010;
end
always @(posedge clk) begin
    data <= rom[addr];
end
endmodule
