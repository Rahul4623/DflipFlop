D Flip-Flop Based Frequency Divider — FPGA Implementation
Implemented on Basys 3 (Artix-7) using Xilinx Vivado. A D flip-flop based frequency divider that scales down the 100 MHz onboard clock to a human-visible frequency using a 27-bit counter.

Why Frequency Division?
The Basys 3 onboard clock runs at 100 MHz, meaning it toggles every 10 nanoseconds (ns).
The human eye can only detect light changes up to approximately 10–12 Hz (i.e., changes slower than ~100ms). At 100 MHz, an LED would be switching 10,000,000 times per second — completely invisible to us. It would appear as a constantly lit LED with no visible blinking.
Calculation
ParameterValueClock frequency100 MHz = 100,000,000 HzClock period1 / 100,000,000 = 10 nsHuman visible range~1 Hz to 12 HzCounter bits used27 bitsDivided frequency100,000,000 / 2²⁷ = ~0.745 HzDivided period1 / 0.745 = ~1.34 seconds

At 0.745 Hz, the LED toggles once every ~1.34 seconds — clearly visible to the human eye.

This is why a 27-bit frequency divider is used: to bring the clock from 10ns (invisible) down to ~1.34 seconds (clearly visible) before driving the D flip-flop output.

How It Works

The 27-bit counter increments on every rising edge of the 100 MHz clock
The MSB (Tclk[26]) toggles at ~0.745 Hz
This divided clock drives a D flip-flop, which captures the D input and outputs it at Q at the human-visible rate
A synchronous reset clears both the counter and output


Block Diagram
CLK (100MHz, 10ns) ──► 27-bit Counter ──► Tclk[26] (~0.745Hz, ~1.34s)
                                                  │
                        D ──────────────► D Flip-Flop ──► Q (LED — visible blink)
                                                  │
                        RESET ────────────────────┘

Files
FileDescriptiondflipflop_fd.vTop-level design — 27-bit counter + D flip-flopdflipflop_fd.xdcConstraint file with pin mappings for Basys 3

Pin Mapping (Basys 3)
SignalPinMapped ToclkW5100 MHz onboard clockresetU18Center button (BTNC)dV17Slide switch SW0qU16LED0

Tools Used

Xilinx Vivado — Synthesis, Implementation, Bitstream generation
Basys 3 FPGA Board — Artix-7 XC7A35T
Language — Verilog HDL


How to Run

Clone the repo
Open Vivado → Create Project → Add dflipflop_fd.v and dflipflop_fd.xdc
Run Synthesis → Implementation → Generate Bitstream
Connect Basys 3 via USB → Program Device
Toggle SW0 (D) and observe LED0 (Q) blink at ~0.745 Hz


Key Concepts Demonstrated

Why frequency division is necessary for human-observable FPGA output
Synchronous D flip-flop design in Verilog
Clock frequency division using a 27-bit binary counter
FPGA implementation and hardware programming on Basys 3
Vivado design flow: RTL → Synthesis → Bitstream


Hardware Implementation
The image below shows the design running on the Basys 3 board, programmed via Vivado Hardware Manager.
<img width="1280" height="960" alt="image" src="https://github.com/user-attachments/assets/9895dc6b-b848-4434-9c44-34774ece845f" />

Author
R Shahishnu Rahul — ECE @ SRM Institute of Science and Technology
