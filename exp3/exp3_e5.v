module DFF_HR(CLK,D,RST,Q);
    input CLK,RST,D;
    output reg Q;
    
    always @(posedge CLK)
    begin 
        if(RST==1)
            Q<=1'b0;
        else 
            Q<=D;
    end
endmodule

