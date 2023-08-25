//iverilog -o .\out\DFF_PP0_tb .\DFF_PP0_tb.v .\DFF_PP0.v .\NOT.v .\NAND.v
module DFF_PP0_tb;
    reg D, C, R;
    wire Q;
    DFF_PP0 u1(.C(C), .D(D), .R(R), .Q(Q));
    
    initial begin  
        C=0;
        forever #50 C=~C;
    end

    initial begin
        $dumpfile("DFF_PP0_tb.vcd");
        $dumpvars(3,C,D,R,Q,u1);
        $display("start");
        R = 0;
        D = 1;
        #130
        D = 0;
        #700;
        D = 1;
        #220;
        D = 1;
        #110;
        R=1;
        #235
        D = 0;
        #400;
        D = 1;
        #300;
        R=0;
        #100;
        D = 0;
        #400;
        D = 1;
        #250
        D=0;
        #50;
         D = 0;
        #420;
        D = 1;
        #210
        D=0;
        #232;
        D=0;
        #115;
        D=1;
        $display("finish");
        $finish;
    end
endmodule