module digits_decoder(
input A,B,
output s1,s2,s3,s4 
);
not not1(A1,A);
not not2(B1,B);
nand and1(s1,A1,B1);
nand and2(s2,A1,B);
nand and3(s3,A,B1);
nand and4(s4,A,B);
endmodule 