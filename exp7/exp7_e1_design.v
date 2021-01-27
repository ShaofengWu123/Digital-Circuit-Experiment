module e1_design(
input [3:0] sw,
output [7:0] led
);
dist_mem_gen_0 inst1(
.a (sw),
.spo (led)
);
endmodule

