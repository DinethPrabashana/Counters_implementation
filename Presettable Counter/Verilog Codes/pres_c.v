module pres_c #(parameter reg_size = 4 )(q, p, load, en, clk );

input [reg_size - 1 : 0] p ;
input load, en , clk ;
output [reg_size - 1 : 0] q ;

reg [reg_size - 1 : 0] preset;
reg [reg_size - 1 : 0] clr;

integer i;

always @(*)
begin 
    for (i = 0 ; i < reg_size ; i = i + 1)
    begin 
        preset [i] = (load & p[i]);
        clr [i] = (load & (~p[i]));
    end 
end

genvar j ;
generate 
    TF tf_1 (q[0], en , clk, clr[0], preset[0]);
    for (j = 1 ; j < reg_size ; j = j + 1)
    begin : gen_TF
        TF tf_u(q[j], en , q[j-1], clr[j], preset[j]) ;
    end
endgenerate

endmodule 


