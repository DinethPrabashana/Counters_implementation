`timescale 10ns/1ns
module tb;
parameter width = 3;
wire [width-1:0]Q;
reg CLOCK, RESET ;

asynchronus_nbit_counter asC(Q,CLOCK,RESET);

initial 
begin
    RESET = 1'b1;
    CLOCK = 1'b0;
    #4 RESET = 1'b0; // De-assert reset after 10 time units
	 # 1000 $finish ;
end

always
begin 
    #10 CLOCK = ~CLOCK ;
end 

endmodule 