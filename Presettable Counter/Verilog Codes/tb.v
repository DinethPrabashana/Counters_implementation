module tb;

parameter reg_size = 4 ;
reg [reg_size - 1 : 0] P ;
reg LOAD, ENABLE , CLOCK ;
wire [reg_size - 1 : 0] Q ;

pres_c #(reg_size) pc (Q, P, LOAD, ENABLE, CLOCK);

always 
begin 
    #5 CLOCK = ~CLOCK ;
end

initial 
begin 
    P = 4'b0011 ; 
    CLOCK = 0 ;
    ENABLE = 0 ;
    LOAD = 0 ;

    #3 ENABLE = 1 ; LOAD = 1 ;
	 #10 LOAD = 0 ;
    #1000 $finish ;
end

endmodule