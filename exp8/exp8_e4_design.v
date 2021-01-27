module e4_design(
input clk,rst,button,[6:0] sw,
output reg [2:0] choice,reg [3:0] data
);
//define state
parameter S_0 = 3'b000;
parameter S_1 = 3'b001;
parameter S_2 = 3'b010;
parameter S_3 = 3'b011;
parameter S_4 = 3'b100;

reg [3:0] next_s;
reg [3:0] current_s;
reg [3:0] seq;
reg [3:0] cnt;
//button_edge
wire button_edge;
reg button_r1,button_r2;
reg digit;

//led
reg [19:0] led_cnt;
wire pulse_400Hz;


//生成button脉冲信号
always@(posedge clk)
 button_r1 <= button;
always@(posedge clk)
 button_r2 <= button_r1;
assign button_edge = button_r1 & (~button_r2);


//update seq
always @(posedge clk)
begin
    if(button_edge)
    begin
        seq[0] <= seq[1];
        seq[1] <= seq[2];
        seq[2] <= seq[3];
        seq[3] <= sw[0]; 
        digit <= sw[0];  
    end
    
end

//update cnt
always @(posedge clk)
begin
    if(button_edge)
    begin
        if(next_s==S_3)
            if(sw[0]==0)
                cnt <= cnt + 4'b1;
    end
end

//part1. combinational logic to generate next state
always @(*)
begin
    if(rst)
        next_s = S_0;
    else if(digit==0)
    begin
        case(current_s)
            S_0: next_s = S_0;
            S_1: next_s = S_0;
            S_2: next_s = S_3;
            S_3: next_s = S_4;
            S_4: next_s = S_0;
            default: next_s = S_0;
        endcase
    end
    else if(digit==1)
    begin
        case(current_s)
            S_0: next_s = S_1;
            S_1: next_s = S_2;
            S_2: next_s = S_2;
            S_3: next_s = S_1;
            S_4: next_s = S_1;
            default: next_s = S_0;
        endcase
    end
end
//part2. sequential logic to update current state
always @(posedge clk)
begin
    if(rst)
        current_s <= S_0;
    else
        if(button_edge)
            current_s <= next_s;    
end
/*part3. output as input for another finite state machine(counter)*/



//signal to drive hexplays
always @(posedge clk)
begin
    if(led_cnt>20'd250000)
        led_cnt <= 20'd0;
    else
        led_cnt <= led_cnt + 20'd1; 
end
assign pulse_400Hz = (led_cnt==20'd250000);
//时分复用
always @(posedge clk)
begin
    if(pulse_400Hz)
        choice <= choice + 3'b001; 
end

always @(*)
begin
    case(choice)
        3'b000: data = {1'b0,1'b0,1'b0,seq[3]};
        3'b001: data = {1'b0,1'b0,1'b0,seq[2]};
        3'b010: data = {1'b0,1'b0,1'b0,seq[1]};
        3'b011: data = {1'b0,1'b0,1'b0,seq[0]};
        3'b100: data = cnt;
        3'b101: data = next_s;
        3'b110: data = 4'b0;
        3'b111: data = 4'b0;
        default:data = 4'b0;
    endcase
end


endmodule
