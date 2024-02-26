module countadorgarrafas9 (
    input wire clk,    // Clock input
    input wire reset,  // Reset input
    output reg [3:0] count // 4-bit output representing the count
);

always @(posedge clk or negedge reset)
begin
    if (reset == 1'b0)
        count <= 4'b0000; // Reset count to 0
    else if (count == 4'b1001) // If count reaches 9, wrap around to 0
        count <= 4'b0000;
    else
        count <= count + 1; // Increment count
end

endmodule 