module NOT (input A, output Y);
	NAND u1 (.A(A), .B(A), .Y(Y));
endmodule