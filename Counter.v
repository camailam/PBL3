module Counter(
    input clk,
    input reset,
    output wire [3:0] count
);

// Registros para controlar o estado do contador
reg [2:0] state;
reg [3:0] count_reg;

// Parâmetros para definir os estados
parameter COUNT_5_TO_0 = 3'b000;
parameter COUNT_9_TO_0 = 3'b001;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        count_reg <= 4'b0101;
        state <= COUNT_5_TO_0;
    end else begin
        case(state)
            COUNT_5_TO_0: begin
                count_reg <= count_reg - 1;
                if (count_reg == 4'b0000) begin
                    count_reg <= 4'b1001;
                    state <= COUNT_9_TO_0;
                end
            end
            COUNT_9_TO_0: begin
                count_reg <= count_reg - 1;
                if (count_reg == 4'b0000) begin
                    count_reg <= 4'b0101;
                    state <= COUNT_5_TO_0;
                end
            end
            default: state <= COUNT_5_TO_0;
        endcase
    end
end

assign count = count_reg;

endmodule 