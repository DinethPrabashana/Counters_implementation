module syn_c #(parameter reg_size = 4 )(en, clr, clk, q);

//port declaration
input en, clr, clk ;
output [reg_size -1 : 0 ] q ;

reg [reg_size - 2 : 0] ctrl ;
integer i;

always @(*)
begin 
	 ctrl [0] = (q[0] & q[1] );
    for (i = 1 ; i < reg_size -1 ; i = i + 1)
    begin 
        ctrl [i] = (q[i+1] & ctrl[i-1] );
    end
end 


TF tf_1(q[0], en, clr, clk);
TF tf_2(q[1], q[0], clr, clk);

genvar j ;
generate 
    for (j = 2 ; j < reg_size ; j = j + 1)
    begin : gen_TF
        TF tf_u(q[j], ctrl[j-2], clr, clk);
    end
endgenerate 

endmodule 
