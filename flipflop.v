module flipflop(
    input clk,
	 input t,
	 output reg q
);

    always @(posedge clk)
    begin
        if (t)
            q <= ~q; 
        else if (t)
            q <= q;    
    end

endmodule 