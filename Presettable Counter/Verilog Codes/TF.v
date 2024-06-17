module TF(Q, T , CLK, CLR, PRESET);
input T, CLK, CLR, PRESET ;
output reg Q ;

always @(negedge CLK or posedge CLR or posedge PRESET)
begin 
    if (CLR)
    begin 
        Q <= 0 ;
    end
    else if (PRESET)
    begin 
        Q <= 1 ;
    end
    else 
    begin 
        if (T)
        begin 
            Q <= ~Q ;
        end
        else Q <= Q ;
    end
end
endmodule 