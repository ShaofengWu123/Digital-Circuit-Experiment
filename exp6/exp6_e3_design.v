module e3_counter(
input clk,
output reg [31:0] cnt);
always@(posedge clk)
begin
    cnt <= cnt + 1'b1;
end   
endmodule
