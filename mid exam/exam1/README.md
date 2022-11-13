# a. description

## specification

N number: N10257233

**4 taps**

take the first 4 digits: 1025

order them high -> low: 5, 2, 1, 0

therefore, position 5, 2, 1, 0 are 4 taps 



**the initial/reset value of the LFSR**

take the last three digits: 233

express these as BCD: 0010, 0011, 0011

take the right-most ten values: 10 0011 0011



**I/O**

clk: input

en:  active-high enable signal

rst: active-high reset signal

data: 10 bit output



## architecture

The design source of LFSR is written in Verilog. The initial/reset value is 1000110011, the i_data is used to store the changed value temporarily and finally assign the value of i_data into the output data. The designed LFSR has XOR “taps” at positions [5, 2, 1, 0]

T1, T2, T3 are temporary storage of the result of XOR operations.  T1 = (bit 0) XOR (bit 1), T2 = T1 XOR (bit 2), T3 = T2 XOR (bit 5).  Then, right rotate 1-bit of the initial data 1000110011 and replace the left most bit with the result of T3 which has the value: (bit 5) XOR ((bit 2) XOR ((bit 1) XOR (bit 0)))



## testbench

The testbench of LFSR design source is written in Verilog. The "test_LFSR_cases.csv" file was used to store the test cases. By defining "in_clk", "in_rst", "in_en" and "out_data" four variables, which correspond to clk, rst, en and data in the design source respectively. Then, the "in_file_rst", "in_file_en" and "out_file_data" are variables read from the "test_LFSR_cases.csv" file. "in_file_rst" and "in_file_en" are input test variable, "out_file_data" is the expected output number. The test aims at comparing the result obtained from using "in_file_rst" and "in_file__en" variables with the expected output "out_file_data". If the obtained output equals to the expected output "out_file_data", the test case is regarded as passed.



There are 12 test cases for LFSR, which contain the following set of input en and rst. 

| en   | rst  |
| ---- | ---- |
| 1    | 0    |
| 1    | 1    |
| 0    | 1    |
| 0    | 0    |

The first ten cases are test cases which test for 10 cycles, the results shows that the LFSR works well when en=1 and rst=0.

Then the pair of (en=1, rst=1), (en=0, rst=1), (en=0, rst=0) are also tested.

If one of the test cases does not have the equality of the result obtained from using "in_file_en" and "in_file_rst" variables and expected output "out_file_data", message "test case error - wrong output" will appear in the Tcl Console and stop the test. If all 12 test cases pass, message "All test cases passed successfully" will be showed in the Tcl Console. 



![result](.\result.png)

# b.  asynchronous or synchronous resets

In this project, the asynchronous reset is used.

**advantage:**

1. Most target device libraries have asynchronous reset ports on their DFF, so using asynchronous reset can save resources.
2. The design is relatively simple.

If using the synchronous rest, the valid duration of the reset signal must be greater than the clock period to be truly recognized by the system and complete the reset task. Also, the combined logic path delay, reset delay, etc. should be  considered.

Therefore, the asynchronous reset is used in this project.



# c. number of cycles

The clock cycle time of this project is 2ns. And the total executing time is 24ns since there are 12 test cases. Therefore, there are 12 cycles.





# Student Exam Code of Conduct 

I certify and affirm that, 

 1. I am aware of the NYU Code of Conduct. 

 2. Work presented is 100% my own. I have not collaborated with anyone on the test. 

 3. I did not misrepresent someone else’s work (e.g. from the internet) as my own. 

 4. I did not discuss, nor in any way divulge the content of this test or my answers. 

 5. I understand that my failure to abide by this code of conduct will result in consequences outlined in the NYU Code of Conduct. 

    Name: Xinran Tang

    Date: 2022/10/21







