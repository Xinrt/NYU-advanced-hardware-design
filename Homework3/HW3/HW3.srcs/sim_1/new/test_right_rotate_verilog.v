`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/12 19:13:15
// Design Name: 
// Module Name: test_right_rotate_verilog
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


module test_right_rotate_verilog();
    reg [7:0] in_dat;
    reg [2:0] in_shift;
    wire [7:0] out_dat;
    
    reg [7:0] in_file_dat;
    reg [2:0] in_file_shift;
    reg [7:0] out_file_dat;
    
    integer file_test_cases;
    
    right_rotate_verilog dut (
        .inVariable(in_dat),
        .shiftBit(in_shift),
        .outVariable(out_dat)
    );
    
    initial begin
        file_test_cases = $fopen("test_right_rotate_verilog_cases.csv", "r");
        if(file_test_cases == 0) begin 
            $display("Could not open test cases file.");
            $stop;
        end
        $display("The test cases file was opended.");
        
        while( !$feof(file_test_cases)) begin 
            $fscanf(file_test_cases, "%b%b%b%b%b%b%b%b %b%b%b %b%b%b%b%b%b%b%b\n", in_file_dat, in_file_shift, out_file_dat);           
            
            in_dat = in_file_dat;
            in_shift = in_file_shift;
            #1;
               
            if(out_dat != out_file_dat) begin
                $display("test case error - wrong output");
                $fclose(file_test_cases);
                $stop;
            end
        end
        $display("All test cases passed successfully");
        $fclose(file_test_cases);
        $stop;
    end
    
endmodule
