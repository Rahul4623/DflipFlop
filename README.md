# D Flip-Flop Based Frequency Divider - FPGA Implementation

Implemented on **Basys 3 (Artix-7)** using Xilinx Vivado. A D flip-flop based frequency divider that scales down the 100 MHz onboard clock to a human-visible frequency using a 27-bit counter.

<br>

## Why Frequency Division?

The Basys 3 onboard clock runs at **100 MHz**, meaning it toggles every **10 nanoseconds (ns)**.

The human eye can only detect light changes up to approximately **10 to 12 Hz** (changes slower than ~100ms). At 100 MHz, an LED switches 10,000,000 times per second which is completely invisible to us. It would appear as a constantly lit LED with no visible blinking at all.

### Calculation

| Parameter | Value |
| :--- | :--- |
| Clock frequency | 100 MHz = 100,000,000 Hz |
| Clock period | 1 / 100,000,000 = **10 ns** |
| Human visible range | ~1 Hz to 12 Hz |
| Counter bits used | 27 bits |
| Divided frequency | 100,000,000 / 2^27 = **~0.745 Hz** |
| Divided period | 1 / 0.745 = **~1.34 seconds** |

At **0.745 Hz**, the LED toggles once every ~1.34 seconds which is clearly visible to the human eye.

This is why a **27-bit frequency divider** is used: to bring the clock from 10ns (invisible) down to ~1.34 seconds (clearly visible) before driving the D flip-flop output.

<br>

## How It Works

- The 27-bit counter increments on every rising edge of the 100 MHz clock
- The MSB `Tclk[26]` toggles at ~0.745 Hz
- This divided clock drives a **D flip-flop**, which captures the `D` input and outputs it at `Q` at the human-visible rate
- A synchronous `reset` clears both the counter and output

<br>

## Block Diagram

```
CLK (100MHz, 10ns) --> 27-bit Counter --> Tclk[26] (~0.745Hz, ~1.34s)
                                                 |
                       D -------------> D Flip-Flop --> Q (LED - visible blink)
                                                 |
                       RESET -------------------+
```

<br>

## Files

| File | Description |
| :--- | :--- |
| `dflipflop_fd.v` | Top-level design: 27-bit counter + D flip-flop |
| `dflipflop_fd.xdc` | Constraint file with pin mappings for Basys 3 |

<br>

## Pin Mapping (Basys 3)

| Signal | Pin | Mapped To |
| :--- | :--- | :--- |
| `clk` | W5 | 100 MHz onboard clock |
| `reset` | U18 | Center button (BTNC) |
| `d` | V17 | Slide switch SW0 |
| `q` | U16 | LED0 |

<br>

## Tools Used

- **Xilinx Vivado** - Synthesis, Implementation, Bitstream generation
- **Basys 3 FPGA Board** - Artix-7 XC7A35T
- **Language** - Verilog HDL

<br>

## How to Run

1. Clone the repo
2. Open Vivado and create a new project
3. Add `dflipflop_fd.v` and `dflipflop_fd.xdc`
4. Run Synthesis, then Implementation, then Generate Bitstream
5. Connect Basys 3 via USB and click Program Device
6. Toggle SW0 (`D`) and observe LED0 (`Q`) blink at ~0.745 Hz

<br>

## Key Concepts Demonstrated

- Why frequency division is necessary for human-observable FPGA output
- Synchronous D flip-flop design in Verilog
- Clock frequency division using a 27-bit binary counter
- FPGA implementation and hardware programming on Basys 3
- Vivado design flow: RTL to Synthesis to Bitstream

<br>



Hardware Implementation
The image below shows the design running on the Basys 3 board, programmed via Vivado Hardware Manager.
<img width="1280" height="960" alt="image" src="https://github.com/user-attachments/assets/9895dc6b-b848-4434-9c44-34774ece845f" />

Author
R Shahishnu Rahul — ECE @ SRM Institute of Science and Technology
