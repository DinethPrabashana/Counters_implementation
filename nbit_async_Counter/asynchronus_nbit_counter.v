module asynchronus_nbit_counter#(parameter width = 4)(q,clk,reset);
input clk, reset ;
output [width -1 :0]q;

T_FF tff1(q[0], clk, reset); // since asynchronus, only the first FF will directly connected to the clk

genvar i;
generate
    for (i = 1; i < width; i = i + 1) begin : T_FF_gen
        T_FF u_tff (q[i], q[i-1], reset);
    end
endgenerate
endmodule

