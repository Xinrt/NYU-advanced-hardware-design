`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/21 20:15:34
// Design Name: 
// Module Name: board
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


module board(
    input wire [15:0] sw,
    output wire [15:0] LED
    );

top my_cool_design(
    .A(sw[0]),
    .B(sw[1]),
    .C(sw[2]),
    .D(LED[0])
);
endmodule
