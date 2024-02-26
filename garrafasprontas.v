//garrafas que já foram vedadas
module garrafasprontas(
    input wire CLK,      // Entrada de clock
    input wire RST,    // Entrada de reset
    output reg [6:0] count // Saída do contador
);

// O contador irá incrementar na borda de subida do clock
always @(posedge CLK or posedge RST) begin
    if (RST) // Condição de reset
        count <= 7'b0000000; // Inicializa o contador com 0
    else if (count < 7'b1000001) // Incrementa se o contador for menor que 65 (em binário)
        count <= count + 1;
    else // Reseta o contador quando chega a 65
        count <= 7'b0000000;
end

endmodule 