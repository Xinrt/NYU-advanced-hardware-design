`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/21 15:23:21
// Design Name: 
// Module Name: test_LFSR
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


module test_LFSR();
    reg in_clk, in_rst, in_en;
    wire [9:0] out_data;
    
    reg in_file_rst, in_file_en;
    reg [9:0] out_file_data;
    
    integer file_test_cases;
    
    LFSR dut (
        .clk(in_clk),
        .en(in_en),
        .rst(in_rst),
        .data(out_data)
    );
    
    initial begin
        file_test_cases = $fopen("test_LFSR_cases.csv", "r");
        if(file_test_cases == 0) begin 
            $display("Could not open test cases file.");
            $stop;
        end
        $display("The test cases file was opended.");
        
        in_clk = 0;
        while( !$feof(file_test_cases)) begin 
            #1;
            in_clk = 0;
            $fscanf(file_test_cases, "%b %b %b%b%b%b%b%b%b%b%b%b\n", in_file_en, in_file_rst, out_file_data);
//            $display("%d", r);
   
            in_en = in_file_en;
            in_rst = in_file_rst;
            #1;
            in_clk = 1;
            if(out_data != out_file_data) begin
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
