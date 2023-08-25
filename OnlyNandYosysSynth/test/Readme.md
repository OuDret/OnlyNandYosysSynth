In this folder there are Gates implementations used in ../all2nand.v

+ DFF_PP0.v
+ NAND.v
+ NOT.v

They all have it's own testbenches

+ DFF_PP0_tb.v
+ NAND_tb.v
+ NOT_tb.v

There are also copies of synthesized verilogs using only NAND gates in ../output 

+ synth_counter.v
+ synth_counter1bit.v
+ synth_dff.v
+ synth_inverter.v

and it's testbenches to test they are working:

+ counter_tb.v
+ counter1bit_tb.v
+ dff_tb.v
+ inverter_tb.v

you can also use them to compare with the verilog codes before synthesis to compare its outputs, who should be the same.

in ./out there are the vpp testbench executable and the .vcd it outputs to analyze and debug all signals.

I've used IcarusVerilog to compile verilog code and gtkwave for .vcd visualization.

Example of use: 

to compile testbench ``` iverilog -o .\out\counter1bit_tb .\counter1bit_tb.v .\synth_counter1bit.v .\DFF_PP0.v .\NOT.v .\NAND.v ```

to run testbench ```vpp \out\counter1bit_tb```

to debug signals ``` gtkwave.exe counter1bit.vcd```