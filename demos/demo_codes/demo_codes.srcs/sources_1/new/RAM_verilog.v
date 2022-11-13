`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/21 00:18:19
// Design Name: 
// Module Name: RAM_verilog
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


module RAM_verilog(
    input wire clk,
    input wire readwrite,   //read = 0, write = 1
    input wire [3:0] addr,
    input wire [7:0] datain,
    output wire [7:0] dataout
    );
    
// write
reg [7:0] skey [0:15];

always @(posedge clk) begin
    if(readwrite == 1)
        skey[addr] <= datain;
end

// read
assign dataout = skey[addr];

endmodule
