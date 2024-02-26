module counter_up_to_6 (
    input clk,    // Clock input
    input reset,  // Reset input
    output reg [3:0] count // 3-bit output representing the count
);

always @(posedge clk or negedge reset)
begin
    if (reset == 1'b0)
        count <= 4'b0000; // Reset count to 0
    else if (count == 4'b0110) // If count reaches 6, wrap around to 0
        count <= 4'b0000;
    else
        count <= count + 1; // Increment count
end

endmodule 