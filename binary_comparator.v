module binary_comparator (
    input [3:0] input_number,  // 4-bit input number
    output reg output_result   // Output result
);

// Parameter representing binary value 9
parameter binary_9 = 4'b0000;

always @* begin
    if (input_number == binary_9)
        output_result = 1; // If input equals binary 9, output is set to 1
    else
        output_result = 0; // Otherwise, output is set to 0
end

endmodule 