`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/20 20:21:54
// Design Name: 
// Module Name: left_rotate_verilog
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


module left_rotate_verilog(
    input [31:0] inVariable,
    input [4:0] shiftBit,
    output [31:0] outVariable
    );
    
     assign outVariable = (shiftBit == 1) ? {inVariable[30:0], inVariable[31:31]}:
                         (shiftBit == 2) ? {inVariable[29:0], inVariable[31:30]}:
                         (shiftBit == 3) ? {inVariable[28:0], inVariable[31:29]}:
                         (shiftBit == 4) ? {inVariable[27:0], inVariable[31:28]}:
                         (shiftBit == 5) ? {inVariable[26:0], inVariable[31:27]}:
                         (shiftBit == 6) ? {inVariable[25:0], inVariable[31:26]}:
                         (shiftBit == 7) ? {inVariable[24:0], inVariable[31:25]}:
                         (shiftBit == 8) ? {inVariable[23:0], inVariable[31:24]}:
                         (shiftBit == 9) ? {inVariable[22:0], inVariable[31:23]}:
                         (shiftBit == 10) ? {inVariable[21:0], inVariable[31:22]}:
                         (shiftBit == 11) ? {inVariable[20:0], inVariable[31:21]}:
                         (shiftBit == 12) ? {inVariable[19:0], inVariable[31:20]}:
                         (shiftBit == 13) ? {inVariable[18:0], inVariable[31:19]}:
                         (shiftBit == 14) ? {inVariable[17:0], inVariable[31:18]}:
                         (shiftBit == 15) ? {inVariable[16:0], inVariable[31:17]}:
                         (shiftBit == 16) ? {inVariable[15:0], inVariable[31:16]}:
                         (shiftBit == 17) ? {inVariable[14:0], inVariable[31:15]}:
                         (shiftBit == 18) ? {inVariable[13:0], inVariable[31:14]}:
                         (shiftBit == 19) ? {inVariable[12:0], inVariable[31:13]}:
                         (shiftBit == 20) ? {inVariable[11:0], inVariable[31:12]}:
                         (shiftBit == 21) ? {inVariable[10:0], inVariable[31:11]}:
                         (shiftBit == 22) ? {inVariable[9:0], inVariable[31:10]}:
                         (shiftBit == 23) ? {inVariable[8:0], inVariable[31:9]}:
                         (shiftBit == 24) ? {inVariable[7:0], inVariable[31:8]}:
                         (shiftBit == 25) ? {inVariable[6:0], inVariable[31:7]}:
                         (shiftBit == 26) ? {inVariable[5:0], inVariable[31:6]}:
                         (shiftBit == 27) ? {inVariable[4:0], inVariable[31:5]}:
                         (shiftBit == 28) ? {inVariable[3:0], inVariable[31:4]}:
                         (shiftBit == 29) ? {inVariable[2:0], inVariable[31:3]}:
                         (shiftBit == 30) ? {inVariable[1:0], inVariable[31:2]}:
                         inVariable[31:0];
endmodule
