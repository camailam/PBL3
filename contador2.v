module contador2(
    input clk,      // Sinal de clock
    input reset,    // Sinal de reset
    output reg [3:0] count  // Saída do contador de 2 bits
);

always @(posedge clk or posedge reset) begin
    if (reset == 1'b1) begin
        count <= 4'b0010;  // Se o sinal de reset estiver alto, reinicie o contador com 2
    end else begin
        case (count)
            4'b0011: count <= 4'b0010;  // Se o contador for 2, vá para 1
            4'b0010: count <= 4'b0001;  // Se o contador for 1, vá para 0
            4'b0001: count <= 4'b0000;  // Se o contador for 0, vá para 2
            default: count <= 4'b0000; // Valor padrão é 0
        endcase
    end
end

endmodule 