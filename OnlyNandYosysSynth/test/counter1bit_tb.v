//iverilog -o .\out\counter1bit_tb .\counter1bit_tb.v .\synth_counter1bit.v .\DFF_PP0.v .\NOT.v .\NAND.v
module counter1bit_tb;
    reg clk, reset;
    wire counter;

    counter1bit count(clk, reset, counter);
    
    initial begin
        clk=0;
        forever #50 clk=~clk;
    end

    initial begin
        $dumpfile("counter1bit.vcd");
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