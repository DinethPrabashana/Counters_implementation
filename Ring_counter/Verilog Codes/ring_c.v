module ring_c #(parameter reg_size = 4)(q ,clk, clr);

//port declaration 
input clk, clr ;
output [reg_size - 1 : 0] q ;

//internal wires
reg [reg_size - 1 : 0] d ;
integer j;

always @(*)
begin 
	d[0] = q[reg_size - 1] ;
    for (j = 1 ; j <reg_size  ; j = j + 1)
    begin 
        d[j] = q[j-1] ; 
    end 
end 

genvar i ;
generate 
    df_preset df_1(q[0], d[0] , clr, clk);
    for (i = 1 ; i < reg_size ; i = i + 1 )
    begin : gen_df_clr
        df_clr df_u(q[i], d [i], clr, clk) ;
    end   
endgenerate
endmodule 





