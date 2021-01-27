module sel4_1(a,b,c,d,sel1,sel2,out1);
    input a,b,c,d,sel1,sel2;
    output out;
   
    wire s1,s2,s3; //声明内部信号
    assign s3 = sel1^sel2;//赋值语句
    //实例化
    sel2_1 inst1(
    .a (a ),
    .b (b ),
    .sel (sel1 )
    .out (s1 ));
    //实例化
     sel2_1 inst2(
    .a (c ),
    .b (d ),
    .sel (sel2 )
    .out (s2 ));
     //实例化
     sel2_1 inst3(
    .a (s1 ),
    .b (s2 ),
    .sel (s3 )
    .out (out1 ));
endmodule

