module DownCounter( //CONTA DE 5 A 0 E DE 9 A 0
    input wire clk, // Clock input
    input wire rst, // Reset input
    output wire [3:0] count // Output count
);

// Counter state register
reg [3:0] count_reg;

// Always block for sequential logic
always @(posedge clk or posedge rst) begin
    if (rst == 1'b1) // Reset condition
        count_reg <= 4'b0101; // Initialize count to 5
    else if (count_reg == 4'b0000) // If count is 0
        count_reg <= 4'b1001; // Reset count to 9
    else // Decrement count
        count_reg <= count_reg - 1;
end

// Output assignment
assign count = count_reg;

endmodule 
//perguntar sobre a escolha dos elementos de memoria e ver se faço isso aqui como uma maquina de estados 