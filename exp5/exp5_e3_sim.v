module test_bench2();
reg CLK,RST_N,D;
wire Q;

d_ff_r inst1(.clk(CLK),.rst_n(RST_N),.d(D),.q(Q));

initial CLK=0;
always #5 CLK=~CLK;
   
initial
begin
    RST_N=0;
    #27.5 RST_N=1;
end

initial
begin 
    D=0;
    #12.5 D=1;
    #25 D=0;
end     

initial
begin
    #55 $finish;
end

endmodule