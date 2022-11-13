`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/20 20:35:31
// Design Name: 
// Module Name: right_rotate_verilog
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


module right_rotate_verilog(
    input [7:0] inVariable,
    input [2:0] shiftBit,
    output [7:0] outVariable
    );
    
    assign outVariable = (shiftBit == 1) ? {inVariable[0:0], inVariable[7:1]}:
                         (shiftBit == 2) ? {inVariable[1:0], inVariable[7:2]}:
                         (shiftBit == 3) ? {inVariable[2:0], inVariable[7:3]}:
                         (shiftBit == 4) ? {inVariable[3:0], inVariable[7:4]}:
                         (shiftBit == 5) ? {inVariable[4:0], inVariable[7:5]}:
                         (shiftBit == 6) ? {inVariable[5:0], inVariable[7:6]}:
                         (shiftBit == 7) ? {inVariable[6:0], inVariable[7]}:                   
                         inVariable[7:0];
endmodule
