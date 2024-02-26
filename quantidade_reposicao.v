module quantidade_reposicao(
    input wire CLK,          // Entrada de clock
    input wire RST,          // Entrada de reset
    output reg count  // Saída válida
);

reg [1:0] counter; // Registro de contagem de 3 bits

// O contador irá incrementar na borda de subida do clock
always @(posedge CLK) begin //or posedge RST
    //if (RST) // Condição de reset
        //counter <= 2'b00; // Inicializa o contador com 0
    //else
        counter <= counter + 1;
end

// A saída é 1 apenas quando o contador for 000
always @* begin
    if ((counter == 2'b01) || (counter ==  2'b10))
        count = 1;
    else
        count = 0;
end 

endmodule 