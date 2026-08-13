4-Bit Synchronous Counter
Overview

This project implements a 4-bit synchronous binary up counter using Verilog HDL.

A synchronous counter is a sequential digital circuit in which all flip-flops are driven by the same clock signal. The counter increments its value on every rising edge of the clock.

The counter has 16 possible states, ranging from 0000 to 1111, corresponding to decimal values 0 to 15.

Features
4-bit binary up counter
Synchronous operation
Common clock signal
Synchronous active-high reset
Counts from 0 to 15
Automatic rollover from 15 to 0
Verilog RTL implementation
Testbench included
VCD waveform generation
Compatible with Icarus Verilog and GTKWave



Counting Sequence
0000 → 0001 → 0010 → 0011
  ↓
0100 → 0101 → 0110 → 0111
  ↓
1000 → 1001 → 1010 → 1011
  ↓
1100 → 1101 → 1110 → 1111
  ↓
0000



Block Diagram



             ┌─────────────────────┐
    clk ────►│                     │
             │   4-Bit Synchronous │
  reset ────►│       Counter       │
             │                     │
             └──────────┬──────────┘
                        │
                        ▼
                    ┌───────┐
                    │ Count │
                    │ [3:0] │
                    └───────┘



Inputs and Outputs

Signal	Direction	Width	Description
clk	Input	1 bit	Clock signal
reset	Input	1 bit	Active-high synchronous reset
count	Output	4 bits	Current counter value
RTL Design

The counter is implemented using a positive-edge-triggered sequential block.

always @(posedge clk) begin
    if (reset)
        count <= 4'b0000;
    else
        count <= count + 4'b0001;
end


When reset is high at a rising clock edge, the counter is cleared to 0000.

When reset is low, the counter increments by one at every rising edge of the clock.

Because the output is 4 bits wide, the counter naturally rolls over after 1111:

1111 + 1 = 0000

Testbench

The testbench performs the following operations:

Initializes the clock and reset.
Applies reset to clear the counter.
Releases reset.
Allows the counter to increment through all 16 states.
Observes the rollover from 1111 to 0000.
Applies reset again.
Generates a VCD waveform file.
Simulation Using Icarus Verilog

Install Icarus Verilog and GTKWave.

Compile the design and testbench:

iverilog -o counter_sim src/counter_4bit.v tb/counter_4bit_tb.v


Run the simulation:

vvp counter_sim


A waveform file named counter_4bit.vcd will be generated.

Open the waveform using GTKWave:

gtkwave counter_4bit.vcd

Expected Output

The simulation should show the counter progressing as follows:

0000
0001
0010
0011
0100
0101
0110
0111
1000
1001
1010
1011
1100
1101
1110
1111
0000

Applications

4-bit counters are commonly used in:

Digital clocks
Frequency dividers
Timers
Digital control systems
Address generation
Event counting
Sequential logic circuits
Tools Used
Verilog HDL
Icarus Verilog
GTKWave
Git and GitHub
Learning Outcomes

This project demonstrates:

Sequential digital logic
Flip-flop based counting
Clocked always blocks
Synchronous reset
RTL design
Verilog testbench development
Digital simulation
Waveform analysis
Author

Your Name
B.Likitha

License

This project is open-source and available under the MIT License.