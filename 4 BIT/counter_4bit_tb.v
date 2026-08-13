`timescale 1ns/1ps

module counter_4bit_tb;

    reg clk;
    reg reset;
    wire [3:0] count;

    // Instantiate DUT
    counter_4bit uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        $dumpfile("counter_4bit.vcd");
        $dumpvars(0, counter_4bit_tb);

        clk = 0;
        reset = 1;

        #10;

        reset = 0;

        #160;

        reset = 1;

        #10;

        reset = 0;

        #40;

        $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time = %0t | Reset = %b | Count = %b",
                 $time, reset, count);
    end

endmodule
