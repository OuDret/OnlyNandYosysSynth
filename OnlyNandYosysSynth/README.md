In this directory we find the following files:

## yosys scripts:

+ synth_counter.ys
+ synth_counter1bit.ys
+ synth_dff.ys
+ synth_inverter.ys

They are used to run yosys synthesis. You must have yosys installed to run it.

$ yosys ./synth_counter.ys

You can learn about the commands in those files here: https://yosyshq.readthedocs.io/projects/yosys/en/latest/cmd_ref.html
		
Let's take a look to the commands that mades yosys to synthesize using only NAND gates.

```
dfflibmap -liberty cells.lib
abc -liberty cells.lib
techmap -map all2nand.v
```
In the first and second lines above we are telling yosys to technolology map both flip flop and internal gate cells to the ones defined in cells.lib

In the third line we made yosys to replace cells in the desgin for the ones in all2nand.v, which are made using only nands.

## cells.lib
As I said, in this file are defined some cells to map to the RTLIL cells to replace them. If we could just define NAND gates there, our job would be done. Unfortunately, NOT, BUFFER, FLIP-FLOP and NAND/NOR GATES must be defined for abc to run.

thats why we also need to run ```techmap -map all2nand.v ```command, to replace all NOT, BUFFER and FLIP-FLOP for NAND gates.

## all2nand.v
As said above, in this file we define cells.lib cells using just NANDS.

I've seen that yosys converts verilog registers (reg) to D-Type Flip Flop with reset. See Table 5.5 in https://yosyshq.readthedocs.io/projects/yosys/en/latest/CHAPTER_CellLib.html. Here you can also see it's behaviour: https://github.com/YosysHQ/yosys/blob/master/techlibs/common/simcells.v

The exact implementation to be done will depend on which flip-flop we have defined in cells.lib. See https://github.com/YosysHQ/yosys/blob/master/techlibs/common/cells.lib for some other examples. 

I dont know where is ```ff(IQ, IQN)``` macro on my cells.lib defined. If you knew where could I find it edit this Readme to tell us. Thanks.

## Verilog codes to synthesize

+ counter.v
+ counter1bit.v
+ dff.v
+ inverter.v

Just some verilog code i synthesized to NANDs netlist  using yosys. Each of them has it's own .ys script to run the synthesis.


