//iverilog -o .\out\inverter_tb .\inverter_tb.v .\synth_inverter.v .\DFF_PP0.v .\NOT.v .\NAND.v
module inverter_tb;
    reg in;

    inverter inv(in, out);
    
    initial begin
        $dumpfile("inverter.vcd");
        $dumpvars(1,inv);
        $display("start");
        in=1;
        #50;
        in=0;
        #50;
        in=1;
        #50;
        in=0;
        #50;
        in=1;
        $display("finish");
        $finish;
    end
endmodule