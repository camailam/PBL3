module divisor_clock(input clk, output wire [2:0]divclock);
  wire [15:0] W;//
  flipflop fft0(.clk(clk), .t(1'b1), .q(W[0]));
  flipflop fft1(.clk(W[0]), .t(1'b1), .q(W[1]));
  flipflop fft2(.clk(W[1]), .t(1'b1), .q(W[2]));
  flipflop fft3(.clk(W[2]), .t(1'b1), .q(W[3]));
  flipflop fft4(.clk(W[3]), .t(1'b1), .q(W[4]));
  flipflop fft5(.clk(W[4]), .t(1'b1), .q(W[5]));
  flipflop fft6(.clk(W[5]), .t(1'b1), .q(W[6]));
  flipflop fft7(.clk(W[6]), .t(1'b1), .q(W[7]));
  flipflop fft8(.clk(W[7]), .t(1'b1), .q(W[8]));
  flipflop fft9(.clk(W[8]), .t(1'b1), .q(W[9]));
  flipflop fft10(.clk(W[9]), .t(1'b1), .q(W[10]));
  flipflop fft11(.clk(W[10]), .t(1'b1), .q(W[11]));
  flipflop fft12(.clk(W[11]), .t(1'b1), .q(divclock[0]));
  flipflop fft13(.clk(divclock[0]), .t(1'b1), .q(divclock[1]));
  flipflop fft14(.clk(divclock[1]), .t(1'b1), .q(divclock[2]));
  //flipflop fft15(.clk(divclock[1]), .t(1'b1), .q(divclock[2]));
  //flipflop fft16(.clk(divclock[1]), .t(1'b1), .q(divclock[2]));
endmodule 
//mudar para fazer um contador a partir disso tbm com fliplop t 
//TIRAR UM FLIPFLOP 