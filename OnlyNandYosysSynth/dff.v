module dff(
    input wire C,
    input wire R,
    input wire D,
    output wire Q
);

always @(posedge C or posedge R) begin
	if (R == 1)
		Q <= 0;
	else
		Q <= D;
end

endmodule