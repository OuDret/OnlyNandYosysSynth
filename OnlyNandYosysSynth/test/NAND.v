module NAND(
    input wire A,
    input wire B,
    output wire Y
);

assign #1 Y = ~(A&B);

endmodule