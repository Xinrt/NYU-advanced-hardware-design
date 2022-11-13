`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/12 19:10:57
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
//                         (shiftBit == 7) ? {inVariable[6:0], inVariable[15:7]}:
//                         (shiftBit == 8) ? {inVariable[7:0], inVariable[15:8]}:
//                         (shiftBit == 9) ? {inVariable[8:0], inVariable[15:9]}:
//                         (shiftBit == 10) ? {inVariable[9:0], inVariable[15:10]}:
//                         (shiftBit == 11) ? {inVariable[10:0], inVariable[15:11]}:
//                         (shiftBit == 12) ? {inVariable[11:0], inVariable[15:12]}:
//                         (shiftBit == 13) ? {inVariable[12:0], inVariable[15:13]}:
//                         (shiftBit == 14) ? {inVariable[13:0], inVariable[15:14]}:                    
                         inVariable[7:0];
endmodule
