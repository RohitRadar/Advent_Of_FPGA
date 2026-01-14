# Advent of FPGA 2025
Solutions and explanations for a few of the problem statements.
All solutions are in verilog and simulated using Vivado 2022.2.
The output waveform graphs are also attached inside the folders.

## Day 1
### ram_tb.v
The input text file is read and if it is L, then a -ve integer is sent as input to the design.
If it is R, then the +ve integer is sent to the design.
The DUT can be changed when testing for Part1 or Part2 design.
### ram.v
Solution for Part1
The initial position is set to 50 in the register **add**.
The **add** register is updated based on the if-else equation as mentioned in the verilog file.
The modulo is used to wrap it again back to 0-99 range. The output is updated by 1 each time (add+ip)%100 is equal to zero.
### ram2.v
Solution for Part2
The initial position is set to 50 in the register **add**.
The first if–else updates **add** as (add+ip)%100, handling negative ip by wrapping the result back into the 0–99 range so add never goes negative.
The second part updates op by counting how many times the addition crosses a multiple of 100: for positive ip it adds (add+ip)/100, and for negative ip it computes how many hundreds are crossed when subtracting, with a special case when add is zero.
No. of clock cycles taken to complete is equal to the number of inputs.

## Day 2
### convert.py
Just for the fun of it I wanted to use python to create the input parameters in the testbench.
The input text file is read and the output text file is created where the ip is stored in 11 BCD format.
For example, if the number is 654321 then the ip is saved as 00000654321.
All the ip in the testbench are just copy pasted from the output file directly: lines 45-223 in tb.
### design_tb.v
The new_ip reg is set for one clock cycle to indicate that a new input is being provided to the design.
### adder.v:
Adds 2 BCD numbers where each number has 11 digits
### bcd_counter.v
This is the top file for the design. Comparator.v and Comparator2.v Designs can be included in this based on part 1 or part 2 problem.
The generate block is for appending 1 each clock cycle to the **op** reg and check if the BCD number is symmetric. The first input is taken and each clock cycle, 1 is appended to it until it reaches input 2's value.
If symmetric, then it is added to the **sum** reg in the add.v design.
No. of clock cycles taken to complete is the addition of all the differences btw ip2 and ip1.
### comparator2.v
This is for part1.
The if-else conditions are based on the digit length of the of the BCD number.
Only even no. of digits can be symmetric here. Those simple if-else conditions are mentioned in the file.
### comparator.v
This is for part2.
The necessary if-else conditions are mentioned in the file for all possible symmetric conditions.
If the number is found to be symmetric, then the op_eq is set.


## Day 3 
### main_tb.v
The input file is read line by line. Each clock cycle, the digits are fed starting from MSB to LSB.
### main_2digit.v
Logic is to find the largest digit existing within 0-99 numbers. If x is the index of that number, then the second largest number will be within x and 100th number.
State machine is used to handle the 100 digits inputted. The output is in unsigned decimal.
### main.v
Logic is the same as main_2digit but now for 12 digits. So first we find largest number within 0-88.
Then we find the maximum within the 89th digit. And then go till 100th in 12 iterations. 
The output is in BCD format. The BCD adder is created in the generate block.
No. of clock cycles taken to complete can vary each time based on where the index lands in each iteration. There is no parallelism in accessing the bram here. Thus, if in first iteration, the index is 10, then the state machine counts from 11 to 89 to check the second largest index.



## Day 4
### convert.py
2D ram is used to store the array. @ is represented as  1 and . as a 0. The python script reads the input text file as stores the data in the ram. We can copy paste the whole text in the initial block in the verilog design.
The ** assign sumcache** lines are also generated and can be copy pasted to the Main1.v file
### Main1.v
The generate block generates if-else conditions for every element in the ram array. If the necessary condition matches, then the sumram[index] is set to 1. The sumcache adds up all the 137*137 elements of sumram memory block. All these are generated using the python script.
Thus due to the heavy parallelization, it needs a big FPGA to implement on, but it gives the output immediately with no need for clock cycles.
### Main1_tb.v
The circuit is fully combinational consiting of only muxes and adders. Thus there is no need to give a clock or time delay for it to compute. Only rst and DUT is given in the tb.
### Main2.v
There is a feedback loop involved to ram here. Every clock cycle, the ram[index] is updated to zero if the sumram[index] is 1. This is done in the generate block using always @(posedge clk). Apart from that, its the same design as Main1.v. It took around 62 clock cycles or iterations to go to the final stable output for the given input.


## Day 5
### convert.py
Just like Day4, this is used to generate the ram module to store the ID ranges. Also for the first part, the input also is generated and can be copy pasted into Main1_tb.v. The ram_input file has only the ID ranges and the input.txt file has the numbers which are to be checked in part 1 of the problem statement.
The even indexes in ram store the starting ID range values and the odd indexes store the ending ID range values.
### Main1.v
The generate block is used to create 194 comparators, which is the number of ID ranges. So whenever an input is fed, any one of the comparators will output a 1. In that case, the **ans** reg is updated by 1. Thus, the clock cycles taken to complete is equal to the number of inputs provided.
### Main1_tb.v
The input values are all copy pasted from the python script.
### Main2.v
The first step involves sorting. The generate block is the design for sorting. The algorithm used is odd-even parallel sort. The **sort_decide** reg alternates every clock cycle to indicate whether the odd or even pair must be sorted. Also there can be multiple same starting ID ranges. In that case, the ending ID ranges are sorted in the descending order. Thus if there are 5 same starting ID's in a row, its corresponding ending ID ranges will be sorted in descending order.\
The second step is performed in the always block with the state machine. In the 0th state, we wait for 194 clock cycles for the sorting to complete. In the 1st state, we change the ending ID range values so that the start->end->start->end...->end ID ranges are in ascending order. In the second state, we subtract the end-start values and add them giving the final answer.\
Thus, no. of clock cycles taken to complete will be 4*number of ram range inputs given.
### Main2_tb.v
A delay of 5*194 clock cycles is given for easier viewing of the final answer.