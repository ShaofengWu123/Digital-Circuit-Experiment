module counter_neg(CLK,RST,CNT);
    input CLK,RST;
    output reg [3:0] CNT;
    
    always @(posedge CLK)
    begin
        if(RST==0)
            CNT <= 4'b1001;
        else if(CNT==4'b0)
            CNT <= 4'b1001;
        else
            CNT <= CNT-4'b0001;
    end
endmodule

