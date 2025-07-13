`timescale 1ns/1ps

module adder_tb;

    // Testbench signals
    reg clk;
    reg rst_n;
    reg [3:0] a, b;
    wire [4:0] sum;

    // Instantiate the design under test (DUT)
    adder_ff uut (
        .clk(clk),
        .rst_n(rst_n),
        .a(a),
        .b(b),
        .sum(sum)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Initialize signals
        clk = 0;
        rst_n = 0;
        a = 0;
        b = 0;

        // Apply reset
        #10;
        rst_n = 1;

        // Test case 1: a = 3, b = 4 → sum = 7
        #10;
        a = 4'd3;
        b = 4'd4;

        // Test case 2: a = 8, b = 7 → sum = 15
        #10;
        a = 4'd8;
        b = 4'd7;

        // Test case 3: a = 9, b = 11 → sum = 20
        #10;
        a = 4'd9;
        b = 4'd11;

        // Test case 4: a = 15, b = 15 → sum = 30
        #10;
        a = 4'd15;
        b = 4'd15;

        #20;
        $finish;
    end

endmodule
