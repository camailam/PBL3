//Máquina de estados que verifica se o motor deve estar ligado ou desligado
module fsm1(
	input PG,RO,VE, CLK,RST,
	output motor
);
reg [1:0] state , nextstate ;
parameter S0 = 2'b00 ;
parameter S1 = 2'b01 ;
// state register
always @ ( posedge CLK , negedge 
RST )
//mudei para  negedge 
if ( RST == 1'b0 ) state <= S0 ;
else state <= nextstate ;
// next state logic 
always @ (*)
case ( state )
S0 : if((PG == 1'b0 && RO == 1'b1 && VE == 1'b0)||
		  (PG == 1'b0 && RO == 1'b1 && VE == 1'b1)||
		  (PG == 1'b1 && RO == 1'b1 && VE == 1'b1)) nextstate = S1 ;
else nextstate = S0 ;
S1 : if((PG == 1'b0 && RO == 1'b1 && VE == 1'b0)||
		  (PG == 1'b0 && RO == 1'b1 && VE == 1'b1)||
		  (PG == 1'b1 && RO == 1'b1 && VE == 1'b1)) nextstate = S1 ;
else nextstate = S0 ;
default : nextstate = S0 ;
endcase
// output logic
assign motor = ( state == S1 ) ;
endmodule  