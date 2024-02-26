module verifica_passa_proximo_contador(
    input [3:0] entrada_4_bits,  // Entrada de 4 bits
    output reg saida            // Saída do contador
);

always @* begin
    if (entrada_4_bits == 4'b1001) // Se a entrada for 0000
        saida = 1; // Saída é 1
    else
        saida = 0; // Caso contrário, saída é 0
end

endmodule 