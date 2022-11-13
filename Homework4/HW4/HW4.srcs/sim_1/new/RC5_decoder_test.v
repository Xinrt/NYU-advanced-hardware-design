`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/11 08:57:22
// Design Name: 
// Module Name: RC5_decoder_test
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


module RC5_decoder_test();
    reg t_clr=0; 
    reg t_clk=1;
    reg t_key_rdy=1;
    reg t_di_vld=1;
    wire [63:0] t_din;
    wire [63:0] t_dout;
    wire t_do_rdy;
    
    RC5_decoder_Verilog dut(
        .clr(t_clr),
        .clk(t_clk),
        .din(t_din),
        .key_rdy(t_key_rdy),
        .di_vld(t_di_vld),
        .do_rdy(do_rdy),
        .dout(t_dout)
    );
    
    integer file_pointer;
    reg[63:0] f_din;
    reg[63:0] f_dout;
    
    assign t_din = f_din;
    reg [6:0] i=1;
    
    initial begin:TEST_PROCESS
        file_pointer = $fopen("Testcases.txt","r");
        if(file_pointer==0) begin
            $display("Couldn't open the file.");
            $finish;
        end
        
        while(!$feof(file_pointer)) begin
            $fscanf(file_pointer,"%x %x\n",f_dout,f_din);
            
            t_clr<=0;
            #1;
            t_clr<=1;
            #12;
            
            if(t_dout != f_dout) begin
                $display("\nTest %d Failed.", i);
                $finish;
            end
            else $display("Test %d Passed",i); 
            i=i+1;     
                
        end
        
        #5;
        if(t_dout != f_dout) begin
                $display("\nTest Failed for Holding value.\n");
                $finish;
            end
            else $display("Test Passed for Holding value");
        
        $display("\nAll test Passed\n");
        $finish;
    end
    
    
    initial begin:CLK_GEN
        forever begin
            t_clk<=1;
            #0.5;
            t_clk<=0;
            #0.5;
        end 
    end
endmodule
