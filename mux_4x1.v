module mux_4x1 (
    input wire [3:0] data_in,  // Input data lines
    input wire [1:0] sel,   // Selection lines
    output reg data_out
	 // Output data line
);

always @* begin
    case (sel)
        2'b00: data_out = data_in[0];
        2'b01: data_out = data_in[1];
        2'b10: data_out = data_in[2];
        2'b11: data_out = data_in[3];
        default: data_out = 1'b0;  // Default output
    endcase
end

endmodule 