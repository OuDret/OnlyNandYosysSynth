/*DFF WITH ASYNC RESET with the following behaviour
module \$_DFF_PP0_ (D, C, R, Q);
input D, C, R;
output reg Q;
always @(posedge C or posedge R) begin
	if (R == 1)
		Q <= 0;
	else
		Q <= D;
end
endmodule
*/
module DFF_PP0(input C, input D, input R, output Q);
    wire nand1_out; // output from nand1
    wire nand2_out; // output from nand2
    wire not_D;
    wire QBAR;

    wire not_R;
    wire and_R;
    wire in;

    wire clock_edge, not_clock_edge, clock_edge_or_reset;
    wire reset_edge, not_reset_edge;
    wire not_1, not_2, not_3, not_4;
    wire not_5, not_6, not_7, not_8;
    
    // clock edge detection
    NOT n3 (.A(C), .Y(not_1));
    NOT n4 (.A(not_1), .Y(not_2));
    NOT n5 (.A(not_2), .Y(not_3));
    NAND u5 (.A(not_3), .B(C), .Y(not_clock_edge));
    NOT n7 (.A(not_clock_edge), .Y(clock_edge));

    // reset edge detection
    NOT n8 (.A(R), .Y(not_4));
    NOT n9 (.A(not_4), .Y(not_5));
    NOT n10 (.A(not_5), .Y(not_6));
    NOT n11 (.A(not_6), .Y(not_7));
    NOT n12 (.A(not_7), .Y(not_8));
    NAND u6 (.A(not_8), .B(R), .Y(not_reset_edge));
    NOT n13 (.A(not_reset_edge), .Y(reset_edge));

    // reset implementation in = D&~R;
    NAND u7 (.A(not_reset_edge), .B(D), .Y(and_R));
    NOT n14 (.A(and_R), .Y(in));

    // also edge detected will be 1 if reset is pressed c= c | R
    NAND u8 (.A(not_reset_edge), .B(not_clock_edge), .Y(clock_edge_or_reset));

    // dff
    NOT n1 (.A(in), .Y(not_D));
    NAND u1 (.A(clock_edge_or_reset), .B(in), .Y(nand1_out));
    NAND u2 (.A(clock_edge_or_reset), .B(not_D), .Y(nand2_out));
    NAND u3 (.A(nand1_out), .B(QBAR), .Y(Q));
    NAND u4 (.A(nand2_out), .B(Q), .Y(QBAR));

endmodule

/*dff latch without reset tested
module DFF_PP0(input C, input D, input R, output Q);
    wire nand1_out; // output from nand1
    wire nand2_out; // output from nand2
    wire not_D;
    wire QBAR;

    NOT n1 (.A(D), .Y(not_D));
    NAND u1 (.A(C), .B(D), .Y(nand1_out));
    NAND u2 (.A(C), .B(not_D), .Y(nand2_out));
    NAND u3 (.A(nand1_out), .B(QBAR), .Y(Q));
    NAND u4 (.A(nand2_out), .B(Q), .Y(QBAR));
endmodule
*/

/*dff without reset, but with edge detection. It's signal doesnt last enough time (1u)
when atlest 3 u is needed for DFF. Must find a way to implement signal extension using logic gates.
module DFF_PP0(input C, input D, input R, output Q);
    wire nand1_out; // output from nand1
    wire nand2_out; // output from nand2
    wire not_D;
    wire QBAR;

    wire edge_detected, not_edgedetected;
    wire not_1, not_2, not_3, not_4;
    //edge detection
    NOT n3 (.A(C), .Y(not_1));
    NOT n4 (.A(not_1), .Y(not_2));
    NOT n5 (.A(not_2), .Y(not_3));
    NAND u5 (.A(not_3), .B(C), .Y(not_edgedetected));
    NOT n7 (.A(not_edgedetected), .Y(edge_detected));

    NOT n1 (.A(D), .Y(not_D));
    NAND u1 (.A(edge_detected), .B(D), .Y(nand1_out));
    NAND u2 (.A(edge_detected), .B(not_D), .Y(nand2_out));
    NAND u3 (.A(nand1_out), .B(QBAR), .Y(Q));
    NAND u4 (.A(nand2_out), .B(Q), .Y(QBAR));
endmodule
*/

/*SYNCRONOUS RESET IF R=1
module DFF_PP0(input C, input D, input R, output Q);
    wire nand1_out; // output from nand1
    wire nand2_out; // output from nand2
    wire not_D;
    wire QBAR;

    wire not_R;
    wire and_R;
    wire in;

    wire edge_detected, not_edgedetected;
    wire not_1, not_2, not_3, not_4;
    
    //edge detection
    NOT n3 (.A(C), .Y(not_1));
    NOT n4 (.A(not_1), .Y(not_2));
    NOT n5 (.A(not_2), .Y(not_3));
    NAND u5 (.A(not_3), .B(C), .Y(not_edgedetected));
    NOT n7 (.A(not_edgedetected), .Y(edge_detected));

    //reset implementation in = D&~R
    NOT n8 (.A(R), .Y(not_R));
    NAND u6 (.A(not_R), .B(D), .Y(and_R));
    NOT n9 (.A(and_R), .Y(in));

    //dff
    NOT n1 (.A(in), .Y(not_D));
    NAND u1 (.A(edge_detected), .B(in), .Y(nand1_out));
    NAND u2 (.A(edge_detected), .B(not_D), .Y(nand2_out));
    NAND u3 (.A(nand1_out), .B(QBAR), .Y(Q));
    NAND u4 (.A(nand2_out), .B(Q), .Y(QBAR));
endmodule
*/

/* async reset when R = 1 still left to add posedge
module DFF_PP0(input C, input D, input R, output Q);
    wire nand1_out; // output from nand1
    wire nand2_out; // output from nand2
    wire not_D;
    wire QBAR;

    wire not_R;
    wire and_R;
    wire in;

    wire clock_edge, not_clock_edge, clock_edge_or_reset;
    wire not_1, not_2, not_3, not_4;
    
    //clock edge detection
    NOT n3 (.A(C), .Y(not_1));
    NOT n4 (.A(not_1), .Y(not_2));
    NOT n5 (.A(not_2), .Y(not_3));
    NAND u5 (.A(not_3), .B(C), .Y(not_clock_edge));
    NOT n7 (.A(not_clock_edge), .Y(clock_edge));

    //reset implementation in = D&~R;
    NOT n8 (.A(R), .Y(not_R));
    NAND u6 (.A(not_R), .B(D), .Y(and_R));
    NOT n9 (.A(and_R), .Y(in));

    //also edge detected will be 1 if reset is pressed c= c | R
    NAND n10 (.A(not_R), .B(not_clock_edge), .Y(clock_edge_or_reset));

    //dff
    NOT n1 (.A(in), .Y(not_D));
    NAND u1 (.A(clock_edge_or_reset), .B(in), .Y(nand1_out));
    NAND u2 (.A(clock_edge_or_reset), .B(not_D), .Y(nand2_out));
    NAND u3 (.A(nand1_out), .B(QBAR), .Y(Q));
    NAND u4 (.A(nand2_out), .B(Q), .Y(QBAR));
endmodule
*/