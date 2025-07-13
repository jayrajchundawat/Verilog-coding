`timescale 1ns/1ps

module scan_tb;

    reg CK;
    reg rst_n;
    reg scan_enable;
    reg scan_in;
    reg [3:0] a, b;
    wire [4:0] sum;
    wire scan_out;

    adder_ff uut (
        .CK(CK),
        .rst_n(rst_n),
        .scan_enable(scan_enable),
        .scan_in(scan_in),
        .a(a),
        .b(b),
        .sum(sum),
        .scan_out(scan_out)
    );

    // Clock generation
    always #5 CK = ~CK;

    initial begin
        $dumpfile("scan_tb.vcd");
        $dumpvars(0, scan_tb);

        CK = 0;
        rst_n = 0;
        scan_enable = 0;
        scan_in = 0;
        a = 0;
        b = 0;

        // Reset
        #10 rst_n = 1;

        // === Functional Test ===
        #10 a = 4'd7; b = 4'd8; // sum = 15
        #10 a = 4'd3; b = 4'd5; // sum = 8

        // === Scan Shift Test ===
        scan_enable = 1;
        scan_in = 1;

        // Shift in 5 ones
        repeat (5) begin
            #10;
            scan_in = 1; // sending 1
        end

        // Turn off scan mode
        scan_enable = 0;

        #20 $finish;
    end

endmodule
