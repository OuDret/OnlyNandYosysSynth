/* Generated by Yosys 0.9 (git sha1 1979e0b) */

(* top =  1  *)
(* src = "inverter.v:1" *)
module inverter(in, out);
  (* src = "inverter.v:2" *)
  input in;
  (* src = "inverter.v:3" *)
  output out;
  (* module_not_derived = 32'd1 *)
  (* src = "all2nand.v:3" *)
  NAND _0_ (
    .A(in),
    .B(in),
    .Y(out)
  );
endmodule
