module sub_test(
    input a,b,
    output c);
    
    assign c = (a<b)?a:b;
endmodule

module test(
    input a,b,c,
    output o);
    
    wire temp;
    sub_test inst1(a,b,temp);
    sub_test inst2(temp,c,o);
endmodule

