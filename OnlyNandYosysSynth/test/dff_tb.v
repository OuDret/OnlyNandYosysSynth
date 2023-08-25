//iverilog -o .\out\dff_tb .\dff_tb.v .\synth_dff.v. .\DFF_PP0.v .\NOT.v .\NAND.v
module dff_tb;
    reg C, R, D;
    wire Q;
    dff u1 (.C(C), .R(R), .D(D), .Q(Q));
    
    initial begin  
        C=0;
        forever #50 C=~C;
    end

    initial begin
        $dumpfile("dff_tb.vcd");
        $dumpvars(0,u1);
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