module tb ;

parameter reg_size = 4 ;
reg CLEAR ,CLOCK ;
wire [reg_size - 1 : 0] Q ;

ring_c #(reg_size) rc (Q,CLOCK, CLEAR);

always
begin 
    #5 CLOCK = ~ CLOCK ;
end

initial 
begin 
    CLOCK = 0 ; CLEAR = 0 ;
    #12 CLEAR = 1 ;
    #1000 $finish ; 
end
endmodule 