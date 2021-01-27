module test_bench4();
reg c1,c2,c3;
reg e1_low,e2_low,e3;
wire d1,d2,d3,d4,d5,d6,d7,d8;

decoder3_8 inst1(e1_low,e2_low,e3,c1,c2,c3,d1,d2,d3,d4,d5,d6,d7,d8);
initial
begin
        {e1_low,e2_low,e3}=3'b001;{c1,c2,c3}=3'b000;
    #20 {c1,c2,c3}=3'b001;
    #20 {c1,c2,c3}=3'b010;
    #20 {c1,c2,c3}=3'b011;
    #20 {c1,c2,c3}=3'b100;
    #20 {c1,c2,c3}=3'b101;
    #20 {c1,c2,c3}=3'b110;
    #20 {c1,c2,c3}=3'b111;
    #20 {e1_low,e2_low,e3}=3'b000;
    #20 $finish;
end

endmodule