D Flip-Flop Based Frequency Divider  FPGA Implementation
Implemented on Basys 3 (Artix-7) using Xilinx Vivado. A D flip-flop based frequency divider that scales down the 100 MHz onboard clock to a human-visible frequency using a 27-bit counter.

How It Works
The Basys 3 board runs at 100 MHz. Toggling an LED directly at that frequency is invisible to the human eye. This design uses a 27-bit counter as a frequency divider:

The counter increments on every rising edge of the 100 MHz clock
The MSB (Tclk[26]) toggles approximately every ~0.67 seconds

100 MHz / 2^27 ≈ 0.745 Hz


This divided clock drives a D flip-flop, which captures the D input and routes it to output Q at the divided frequency
A synchronous reset clears both the counter and output

This makes LED behavior clearly visible on the board.

Block Diagram
CLK (100MHz) ──► 27-bit Counter ──► Tclk[26] (~0.745Hz)
                                         │
                 D ──────────────► D Flip-Flop ──► Q (LED)
                                         │
                 RESET ──────────────────┘

Files
FileDescriptiondflipflop_fd.vTop-level design — counter + D flip-flopconstraints.xdcPin mappings for Basys 3 (clk, reset, d, q)

Pin Mapping (Basys 3)
SignalPinDescriptionclkW5100 MHz onboard clockreset—Mapped to a pushbuttond—Mapped to a slide switchq—Mapped to an LED

Update pin assignments based on your .xdc constraint file.


Tools Used

Xilinx Vivado — Synthesis, Implementation, Bitstream generation
Basys 3 FPGA Board — Artix-7 XC7A35T
Language — Verilog HDL


How to Run

Clone the repo
Open Vivado → Create Project → Add dflipflop_fd.v and constraints.xdc
Run Synthesis → Implementation → Generate Bitstream
Connect Basys 3 via USB → Program Device
Toggle the switch (D) and observe the LED (Q) update at ~0.745 Hz


Key Concepts Demonstrated

Synchronous D flip-flop design in Verilog
Clock frequency division using a binary counter
FPGA implementation and hardware programming on Basys 3
Vivado design flow: RTL → Synthesis → Bitstream


Author
Rahul — ECE @ SRM Institute of Science and Technology
