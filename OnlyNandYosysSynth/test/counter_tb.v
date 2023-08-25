//iverilog -o .\out\counter_tb .\counter_tb.v .\synth_counter.v .\DFF_PP0.v .\NOT.v .\NAND.v
module counter_tb;
    reg clk, reset;
    wire [3:0] counter;

    counter count(clk, reset, counter);
    
    initial begin
        clk=0;
        forever #50 clk=~clk;
    end

    initial begin
        $dumpfile("counter.vcd");
        $dumpvars(1,count, clk);
        $display("start");
        reset = 0;
        #500
        reset=1;
        #500;
        reset=0;
        #5000;
        $display("finish");
        $finish;
    end
endmodule