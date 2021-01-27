module sub_test(
    input a,b,
    output o);
    
    assign o = a + b;
endmodule

module test(
    input a,b,
    output c);
    
    sub_test inst1(a,b,c);
endmodule

