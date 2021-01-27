module decoder3_8(e1_low,e2_low,e3,c1,c2,c3,d1,d2,d3,d4,d5,d6,d7,d8);
    input c1,c2,c3;
    input e1_low,e2_low,e3;
    output reg d1,d2,d3,d4,d5,d6,d7,d8;
    
    always @(*)
    if({e1_low,e2_low,e3}==3'b001)
    begin
    begin
        case({c1,c2,c3})
            3'b000:  {d1,d2,d3,d4,d5,d6,d7,d8}=8'b10000000;
            3'b001:  {d1,d2,d3,d4,d5,d6,d7,d8}=8'b01000000;
            3'b010:  {d1,d2,d3,d4,d5,d6,d7,d8}=8'b00100000;
            3'b011:  {d1,d2,d3,d4,d5,d6,d7,d8}=8'b00010000;
            3'b100:  {d1,d2,d3,d4,d5,d6,d7,d8}=8'b00001000;
            3'b101:  {d1,d2,d3,d4,d5,d6,d7,d8}=8'b00000100;
            3'b110:  {d1,d2,d3,d4,d5,d6,d7,d8}=8'b00000010;
            3'b111:  {d1,d2,d3,d4,d5,d6,d7,d8}=8'b00000001;
            default: {d1,d2,d3,d4,d5,d6,d7,d8}=8'b0;
        endcase
    end
    end
    
    else
    begin
    {d1,d2,d3,d4,d5,d6,d7,d8}=8'b11111111;
    end
endmodule
