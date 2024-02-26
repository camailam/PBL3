module verificarolhas(
    input [3:0] entrada_4_bits,  // Entrada de 4 bits
    input [3:0] entrada_2_bits,  // Entrada de 2 bits
    output reg saida            // Saída do contador
);

always @* begin
    if (entrada_4_bits == 4'b0000 && entrada_2_bits == 4'b0000) // Se a entrada for 0000 e 00
        saida = 0; // Saída é 0
    else
        saida = 1; // Caso contrário, saída é 1
end

endmodule  