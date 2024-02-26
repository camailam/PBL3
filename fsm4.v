//Máquina de estados que verifica dispensador 
module fsm4(
	input COUNT1, COUNT2, CLK,RST,
	output dispensador
);
reg [1:0] state , nextstate ;
parameter S0 = 2'b00 ;
parameter S1 = 2'b01 ;
// state register
always @ ( posedge CLK , negedge 
RST )
if (RST == 1'b0) state <= S0 ;
else state <= nextstate ;
// next state logic
always @ (*)
case ( state )
S0 : if ( COUNT1 == 1'b1 && COUNT2 == 1'b1 ) nextstate = S1 ;
else nextstate = S0 ;
S1 : if ( (COUNT1 == 1'b0 && COUNT2 == 1'b1 ) ||
          (COUNT1 == 1'b1 && COUNT2 == 1'b0)) nextstate = S0 ;
else nextstate = S1 ;
default : nextstate = S0 ;
endcase
// output logic
assign dispensador = ( state == S1 ) ;
endmodule 