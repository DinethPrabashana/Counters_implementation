module df_preset(Q, D, CLR, CLK);
input D, CLR, CLK ;
output reg Q ;

always @(posedge CLK or negedge CLR )
begin 
    if (~CLR)
    begin 
        Q <= 1 ;
    end
    else 
    begin 
        Q <= D ;
    end
end
endmodule 