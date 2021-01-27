module counter_16bit(
input clk,rst,button,
input [6:0] ctrl,
output reg [3:0] result,
output reg [2:0] choice
);
reg [7:0] cnt;
//reg [7:0] cnt1;
reg [19:0] led_cnt;
wire pulse_100Hz;
wire button_edge;//持续时间为1 clk周期的脉冲信号，用于button指示递增或递减一次
reg button_r1,button_r2;
//生成button脉冲信号
always@(posedge clk)
 button_r1 <= button;
always@(posedge clk)
 button_r2 <= button_r1;
assign button_edge = button_r1 & (~button_r2);

//第一部分，组合逻辑生成次态
always @(posedge clk)
begin
    if(rst)
        cnt <= 8'h1f;
    else 
    begin
    if (button_edge==1)
    begin
        if(ctrl[0] == 1'b1)
            cnt <= cnt + 8'b1;
        else
            cnt <= cnt - 8'b1; 
    end
    end
end
//第二部分，时序逻辑生成现态
/*always @(posedge clk)
begin
    if(rst)
        cnt1 <= 8'h1f;
    else
        cnt1 <= cnt;
end*/
//第三部分，组合逻辑生成输出
always @(*)
begin
    if(choice == 3'b0)
    begin
        result[0] = cnt[0];
        result[1] = cnt[1];
        result[2] = cnt[2];
        result[3] = cnt[3];
    end
    else
    begin
        result[0] = cnt[4];
        result[1] = cnt[5];
        result[2] = cnt[6];
        result[3] = cnt[7];
    end
end


//两个数码管所需要的100Hz刷新信号
always @(posedge clk)
begin
    if(led_cnt>20'd1000000)
        led_cnt <= 20'd0;
    else
        led_cnt <= led_cnt + 20'd1; 
end
assign pulse_100Hz = (led_cnt==20'd1000000);
//时分复用
always @(posedge clk)
begin
    if(pulse_100Hz)
        begin
        if(choice==3'b000)
            choice <= 3'b001;
        else
            choice <= 3'b000;
        end
end
endmodule