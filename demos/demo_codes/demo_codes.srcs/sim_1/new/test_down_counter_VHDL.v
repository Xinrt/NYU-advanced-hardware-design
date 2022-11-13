`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/20 22:42:02
// Design Name: 
// Module Name: test_down_counter_VHDL
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


module test_down_counter_VHDL();

    reg in_clk, in_rst, in_cnt_en;
    wire [15:0] out_cnt;
    
    reg in_file_rst, in_file_cnt_en;
    reg [15:0] out_file_cnt;
    
    integer file_test_cases;
    
    down_counter_VHDL dut (
        .clk(in_clk),
        .cnt_en(in_cnt_en),
        .rst(in_rst),
        .cnt(out_cnt)
    );
    
    initial begin
        file_test_cases = $fopen("test_CounterB_cases.csv", "r");
        if(file_test_cases == 0) begin 
            $display("Could not open test cases file.");
            $stop;
        end
        $display("The test cases file was opended.");
        
        in_clk = 0;
        while( !$feof(file_test_cases)) begin 
            #1;
            in_clk = 0;
            $fscanf(file_test_cases, "%b %b %b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b\n", in_file_cnt_en, in_file_rst, out_file_cnt);
//            $display("%d", r);
   
            in_cnt_en = in_file_cnt_en;
            in_rst = in_file_rst;
            #1;
            in_clk = 1;
            
            if(out_cnt != out_file_cnt) begin
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
