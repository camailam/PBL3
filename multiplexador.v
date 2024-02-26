module multiplexador(	
	input wire [15:0] entradas,
	input wire [1:0] sel,
	output wire [3:0] saida
	
);
mux_4x1 mux_inst_1 (
    .data_in({entradas[15],entradas[11],entradas[3],entradas[7]}),
    .sel({sel[1],sel[0]}),
    .data_out(saida[3])
  );
  mux_4x1 mux_inst_2 (
    .data_in({entradas[14],entradas[10],entradas[2],entradas[6]}),
    .sel({sel[1],sel[0]}),
    .data_out(saida[2])
  );
  mux_4x1 mux_inst_3 (
    .data_in({entradas[13],entradas[9],entradas[1],entradas[5]}),
    .sel({sel[1],sel[0]}),
    .data_out(saida[1])
  );
  mux_4x1 mux_inst_4 (
    .data_in({entradas[12],entradas[8],entradas[0],entradas[4]}),
    .sel({sel[1],sel[0]}),
    .data_out(saida[0])
  );
endmodule 