`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/10 13:48:59
// Design Name: 
// Module Name: right_rotate
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


module right_rotate(
    input [31:0] inVariable,
    input [4:0] shiftBit,
    output [31:0] outVariable
    );

    assign outVariable = (shiftBit == 1) ? {inVariable[0:0], inVariable[31:1]}:
                         (shiftBit == 2) ? {inVariable[1:0], inVariable[31:2]}:
                         (shiftBit == 3) ? {inVariable[2:0], inVariable[31:3]}:
                         (shiftBit == 4) ? {inVariable[3:0], inVariable[31:4]}:
                         (shiftBit == 5) ? {inVariable[4:0], inVariable[31:5]}:
                         (shiftBit == 6) ? {inVariable[5:0], inVariable[31:6]}:
                         (shiftBit == 7) ? {inVariable[6:0], inVariable[31:7]}:
                         (shiftBit == 8) ? {inVariable[7:0], inVariable[31:8]}:
                         (shiftBit == 9) ? {inVariable[8:0], inVariable[31:9]}:
                         (shiftBit == 10) ? {inVariable[9:0], inVariable[31:10]}:
                         (shiftBit == 11) ? {inVariable[10:0], inVariable[31:11]}:
                         (shiftBit == 12) ? {inVariable[11:0], inVariable[31:12]}:
                         (shiftBit == 13) ? {inVariable[12:0], inVariable[31:13]}:
                         (shiftBit == 14) ? {inVariable[13:0], inVariable[31:14]}:
                         (shiftBit == 15) ? {inVariable[14:0], inVariable[31:15]}:
                         (shiftBit == 16) ? {inVariable[15:0], inVariable[31:16]}:
                         (shiftBit == 17) ? {inVariable[16:0], inVariable[31:17]}:
                         (shiftBit == 18) ? {inVariable[17:0], inVariable[31:18]}:
                         (shiftBit == 19) ? {inVariable[18:0], inVariable[31:19]}:
                         (shiftBit == 20) ? {inVariable[19:0], inVariable[31:20]}:
                         (shiftBit == 21) ? {inVariable[20:0], inVariable[31:21]}:
                         (shiftBit == 22) ? {inVariable[21:0], inVariable[31:22]}:
                         (shiftBit == 23) ? {inVariable[22:0], inVariable[31:23]}:
                         (shiftBit == 24) ? {inVariable[23:0], inVariable[31:24]}:
                         (shiftBit == 25) ? {inVariable[24:0], inVariable[31:25]}:
                         (shiftBit == 26) ? {inVariable[25:0], inVariable[31:26]}:
                         (shiftBit == 27) ? {inVariable[26:0], inVariable[31:27]}:
                         (shiftBit == 28) ? {inVariable[27:0], inVariable[31:28]}:
                         (shiftBit == 29) ? {inVariable[28:0], inVariable[31:29]}:
                         (shiftBit == 30) ? {inVariable[29:0], inVariable[31:30]}:                     
                         inVariable[31:0];
endmodule
