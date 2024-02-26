module cincorolhas(
    input [3:0] entrada_2_bits,  // Entrada de 2 bits
    input [3:0] entrada_4_bits,  // Entrada de 4 bits
    output reg saida            // Saída do contador
);

always @* begin
    if (entrada_2_bits == 4'b0000 && entrada_4_bits == 4'b0101) // Se a entrada for 00 e 101
        saida = 1; // Saída é 1
    else
        saida = 0; // Caso contrário, saída é 0
end

endmodule 