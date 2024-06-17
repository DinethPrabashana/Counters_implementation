module tb ;

parameter reg_size  = 4 ;
reg EN, CLEAR, CLOCK ;
wire [reg_size -1 : 0 ] Q ;

syn_c #(reg_size) sc (EN, CLEAR, CLOCK, Q);

always 
begin 
    #5 CLOCK = ~CLOCK ;
end

initial 
begin 
    EN = 0 ;
    CLEAR = 1 ; 
    CLOCK = 0 ;

    #12 EN = 1 ;
    CLEAR = 0 ; 
    #1000 $finish ;
end

endmodule


