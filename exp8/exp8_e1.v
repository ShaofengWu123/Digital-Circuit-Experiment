module exercise_1(
input clk,rst,
output led
);
reg [1:0] cnt1;
reg [1:0] cnt;
//第一部分，纯组合逻辑生成次态
always @(*)
begin
    cnt1 = cnt + 2'b1;
end
//第二部分，把次态赋给现态
always @(posedge clk or posedge rst)
begin
    if(rst)
        cnt <= 2'b0;
    else
        cnt <= cnt1;
end
//第三部分，纯组合逻辑生成输出
assign led = (cnt == 2'b11)? 1'b1 : 1'b0;
endmodule