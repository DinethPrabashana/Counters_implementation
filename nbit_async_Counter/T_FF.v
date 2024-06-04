module T_FF(q,clk,reset);
input clk, reset ;
output reg q ;
always@(negedge clk )
begin 
    if (reset)
        begin
        q<=1'b0;
        end
    
    else
        begin
        q <= ~q ;
        end
    
end
endmodule