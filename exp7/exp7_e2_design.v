module e2_design(
input clk,[7:0] sw,
output reg choice1,choice2,choice3,
output reg hexdata1,hexdata2,hexdata3,hexdata4
);
reg [19:0] cnt;
wire pulse_50mhz;
wire [7:0] romdata1;
wire [7:0] romdata2;
dist_mem_gen_0 inst1(sw[3:0],romdata1);
dist_mem_gen_0 inst2(sw[7:4],romdata2);

always @(posedge clk)
begin
    //if(rst)
        //cnt <= 4'h0;
    if(cnt>10000)
        cnt <= 20'd0;
    else
        cnt <= cnt + 20'd1;
end   
assign pulse_50mhz = (cnt == 20'd10000);

always @(posedge clk)
begin
    if(pulse_50mhz)
        begin
        choice1 <= ~choice1;
        choice2 <= 0;
        choice3 <= 0; 
        end
end

always @(*)
begin
 case(choice1)
    0:{hexdata1,hexdata2,hexdata3,hexdata4} = romdata1;
    1:{hexdata1,hexdata2,hexdata3,hexdata4} = romdata2;
    default:{hexdata1,hexdata2,hexdata3,hexdata4} = 4'h0;
 endcase
end

endmodule