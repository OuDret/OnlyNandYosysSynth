//iverilog -o .\out\NAND_tb .\NAND_tb.v .\NAND.v
module NAND_tb;
    reg A, B;
    wire Y;
    NAND u1(.A(A), .B(B), .Y(Y));
    
    initial begin
        $dumpfile("NAND_tb.vcd");
        $dumpvars(2,A, B, Y);
        $display("start");
        A = 1; B= 1;
        #50;
        A = 1; B= 0;
        #50;
        A = 0; B= 1;
        #50;
        A = 0; B= 0;
        #50;
        $display("finish");
        $finish;
    end
endmodule