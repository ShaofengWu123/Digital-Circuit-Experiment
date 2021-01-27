module DFF_S(CLK,D,SET,Q);
    input CLK,D,SET;
    output reg Q;
    
    always @(posedge CLK)
    begin
        if(SET)
            Q <= 1'b1;
        else
            Q <= D;
    end
endmodule

