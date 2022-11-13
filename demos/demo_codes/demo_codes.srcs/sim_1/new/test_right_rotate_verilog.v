`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/20 20:39:40
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

    // input variables, remeber to include the length of the variables
    reg [7:0] in_dat;
    reg [2:0] in_shift;
    // output variables can only use the "wire" type
    wire [7:0] out_dat;
    
    // variables read from the test file
    reg [7:0] in_file_dat;
    reg [2:0] in_file_shift;
    reg [7:0] out_file_dat;
    
    // file pointer
    integer file_test_cases;
    
    // link the design source code with the simulation test code
    right_rotate_verilog dut (
        .inVariable(in_dat),
        .shiftBit(in_shift),
        .outVariable(out_dat)
    );
    
    // test begin 
    initial begin
        // read from the file 
        file_test_cases = $fopen("test_right_rotate_verilog_cases.csv", "r");
        if(file_test_cases == 0) begin 
            $display("Could not open test cases file.");
            $stop;
        end
        
        // file is opended 
        $display("The test cases file was opended.");
        
        // read from the file 
        while( !$feof(file_test_cases)) begin 
            $fscanf(file_test_cases, "%b%b%b%b%b%b%b%b %b%b%b %b%b%b%b%b%b%b%b\n", in_file_dat, in_file_shift, out_file_dat);           
            
            in_dat = in_file_dat;
            in_shift = in_file_shift;
            // remember to wait
            #1;
            
            // print out the value of variables
            // $display("output", out_file_dat);
            
            if(out_dat != out_file_dat) begin
                $display("test case error - wrong output");
                $fclose(file_test_cases);
                $stop;
            end
        end
        
        $display("All test cases passed successfully");
        $fclose(file_test_cases);
        // remember to stop the simulation when all test cases passed
        $stop;
    end
endmodule
