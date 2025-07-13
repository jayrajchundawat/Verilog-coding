module adder_ff (
    input  ck,
    input  rst_n,
    input  [3:0] a,
    input  [3:0] b,
    output [4:0] sum
);

    reg [4:0] sum_reg;

    always @(posedge ck) begin
        if (!rst_n)
            sum_reg <= 5'b0;
        else
            sum_reg <= a + b;
    end

    assign sum = sum_reg;

endmodule

