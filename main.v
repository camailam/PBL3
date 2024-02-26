module main(
	input ST,CLK,PG,CH,pulso,
	output a,b,c,d,f,g,alarm,
	output wire [6:0] display,
	output wire [3:0] digitos
);
// a = start stop 
// b = motor
// c = nada
// d = enchendo 
// f = vedada
// g = dispensador foi ativado
// display[6] = g e display[0] = a
//pulso é pino 12
//alarm é buzzer
//
wire [15:0] contagem;
wire output_valid;
wire VEDADA;
wire reporolhas;
wire rolhas;
wire clkcontador;
wire disp;
wire conta6;
wire [3:0] decod;
wire [2:0] clock;
divisor_clock divisor(
	.clk(pulso),
	.divclock({clock[2],clock[1],clock[0]})
);
fsm1 maquina1(
	.PG(PG),
	.RO(rolhas),
	.VE(VEDADA),
	.CLK(CLK),
	.RST(ST),
	.motor(b)
);
fsm2 maquina2(
	.CH(CH),
	.PG(PG),
	.RO(rolhas),
	.CLK(CLK),
	.RST(ST),
	.VE(VEDADA),
	.NADA(c),
	.EV(d)
	//.CHEIA(e)
);
fsm4 maquina3(
	.COUNT1(reporolhas),
	.COUNT2(output_valid),
	.CLK(CLK),
	.RST(ST),//talvez eu só tire o reset 
	.dispensador(disp)
);
quantidade_reposicao tresrepo(
	.CLK(reporolhas),//toda vez que for 0 
	//.RST(), PENSAR
	.count(output_valid)
);
cincorolhas cincorolhas(
	.entrada_2_bits({contagem[3],contagem[2],contagem[1],contagem[0]}),
	.entrada_4_bits({contagem[7],contagem[6],contagem[5],contagem[4]}),
	.saida(reporolhas)
);
DownCounter contador9(
	.clk(VEDADA),
	.rst(disp),
	.count({contagem[7],contagem[6],contagem[5],contagem[4]})
);
//RECEBE 3 BITS SE 000 SAIDA 1
contador2 contador2(
	.clk(clkcontador),
	.reset(disp),
	.count({contagem[3],contagem[2],contagem[1],contagem[0]})
); 
verificarolhas verificarolhas(
	.entrada_4_bits({contagem[7],contagem[6],contagem[5],contagem[4]}),
	.entrada_2_bits({contagem[3],contagem[2],contagem[1],contagem[0]}),
	.saida(rolhas)
);
verifica_passa_proximo_contador aa(
	.entrada_4_bits({contagem[7],contagem[6],contagem[5],contagem[4]}),
	.saida(clkcontador)
);
countadorgarrafas9 bb(
	.clk(VEDADA),
	.reset(ST),
	.count({contagem[11],contagem[10],contagem[9],contagem[8]})
);
counter_up_to_6 cc(
	.clk(conta6),
	.reset(ST),
	.count({contagem[15],contagem[14],contagem[13],contagem[12]})
);
binary_comparator dd(
	.input_number({contagem[11],contagem[10],contagem[9],contagem[8]}),
	.output_result(conta6)
);
multiplexador ee(
	.entradas({contagem[15],contagem[14],contagem[13],contagem[12],contagem[11],contagem[10],contagem[9],contagem[8],contagem[7],contagem[6],contagem[5],contagem[4],contagem[3],contagem[2],contagem[1],contagem[0]}),
	.sel({clock[1],clock[0]}),
	.saida({decod[3],decod[2],decod[1],decod[0]})
);
seven_segment_decoder ff(
	.input_number({decod[3],decod[2],decod[1],decod[0]}),
	.seg_display({display[6],display[5],display[4],display[3],display[2],display[1],display[0]})
);
digits_decoder rr(
	.A({clock[1]}),
	.B({clock[0]}),
	.s1({digitos[3]}),
	.s2({digitos[2]}),
	.s3({digitos[1]}),
	.s4({digitos[0]})
);
alarme alar(
	.a(rolhas),
	.b(alarm)
);
assign f = VEDADA;
assign a = ST ;
assign g = disp;
endmodule 
//rever tabelas
//adicionar botão
//adicionar variáveis nas máquinas 
//tem que ter o estado aciona vedação aciona alarme antes de ligarem de fato 
//contadores separados para cada dígito 
//pulso pra continuar passando de estado? 