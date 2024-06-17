module TF(Q , T, CLR, CLK);
input T, CLR, CLK ;
output reg Q ;

always @(posedge CLK or posedge CLR)
begin 
    if (CLR)
    Q <= 0 ;
    else
    begin 
        Q <= T?(~Q):Q ;
    end

end
endmodule