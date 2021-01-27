module sel2_1(a,b,sel,out);
    input a,b,sel;
    output out;
    
    assign out = a&~sel|b&sel;//赋值语句
endmodule

