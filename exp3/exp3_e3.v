module Counter4(CLK,RST,CNT);
    input CLK,RST;
    output reg [3:0] CNT;
    
    always @(posedge CLK or negedge RST)
    begin
        if(RST==0)
            CNT <= 4'b0;
        else
            CNT <= CNT + 4'b1;
    end
endmodule

