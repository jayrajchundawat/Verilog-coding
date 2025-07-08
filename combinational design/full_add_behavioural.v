module full_add_behavioral (
    input a,
    input b,
    input carry_in,
    output reg sum,
    output reg carry_out
);

    always @(*) begin
        // Behavioral logic using high-level description
        sum = a ^ b ^ carry_in;
        carry_out = (a & b) | (carry_in & (a ^ b));
    end

endmodule
