//Máquina de estados que verifica vedação 
module fsm2(
	input PG,CH,RO,CLK,RST,
	output  NADA,EV,CHEIA,VE
);
reg [1:0] state , nextstate ;
parameter S0 = 2'b00 ;
parameter S1 = 2'b01 ;
parameter S2 = 2'b10 ;
parameter S3 = 2'b11 ;
// state register
always @ ( posedge CLK , negedge 
RST )
if ( RST == 1'b0 ) state <= S0 ;
else state <= nextstate ;
// next state logic
always @ (*)
case ( state )
S0 : if (PG == 1'b1 && CH == 1'b0 && RO == 1'b1) nextstate = S1 ;
else nextstate = S0 ;
S1 : if (PG == 1'b1 && CH == 1'b0 && RO == 1'b1)nextstate = S1 ;
else if (PG == 1'b1 && CH == 1'b1 && RO == 1'b1) nextstate = S2; 
else nextstate = S0 ;
S2 : if (PG == 1 && CH == 1 && RO == 1) nextstate = S3;
else nextstate = S0;
S3 : if (PG == 1 && CH == 1 && RO == 1) nextstate = S3;
else nextstate = S0;
default : nextstate = S0 ;
endcase
// output logic
assign NADA = ( state == S0 ) ;
assign EV = ( state == S1 ) ;
assign CHEIA = ( state == S2 ) ;
assign VE = ( state == S3) ;
endmodule 