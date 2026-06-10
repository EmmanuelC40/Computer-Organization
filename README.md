# Computer Organization (VHDL Projects)

## Overview
This repository features a cumulative series of **Computer Organization exercises** implemented in **VHDL** using **Intel Quartus Prime Lite** and verified via **ModelSim** simulation. The projects progress from basic combinational logic to a simplified **CPU-style datapath**, demonstrating core hardware design and verification concepts.

Each sub-project acts as an architectural building block and includes:
- Well-documented VHDL source code
- ModelSim testbenches and waveform simulation
- Block diagrams and design analysis
- A detailed PDF report with full explanations

## Tools & Environment
| Component | Technology / Tool Used |
| ---- | ---- |
| HDL | VHDL |
| FPGA Toolchain | Intel Quartus Prime Lite (18.1)|
| Simulator | ModelSim - Intel FPGA Starter Edition 10.5b (Quartus Prime 18.1) |
| Design Libraries | Intel LPM (Library of Parameterized Modules) |
| Target Platform | Simulation-Only (Not synthesized for physical deployment) |

## Project Roadmap & Learning Progression

The repository is organized sequentially. The core focus is on understanding how abstract logic circuits scale dynamically into functional computer components:

```
.
├── Computer-Organization/
│   ├── 1. Combinational Logic ------> [Exercise 1: Multiplexer]
|   ├── 2. Data Routing & Control ---> [Exercise 2: Encoder-Decoder]
|   └── 3. Sequential Architecture --> [Exercise 3: Datapath]
│
├── .gitignore
|
└── README.md
```

## Exercise 1: Multiplexer Design and Modeling Styles
- **The Goal:** Master basic combinational logic and evaluate Dataflow vs. Behavioral vs. Structural VHDL modeling styles for design optimization.
- **Key Deliverables:** 4:1 and 8-bit multiplexers verified via reusable testbenches.
- **Links:**
[View Code & README](https://github.com/EmmanuelC40/Computer-Organization/tree/3e29198697e272602dc0b8e56f40dca37f9c5904/exercise-1-multiplexer) | [Read Full Report](https://github.com/EmmanuelC40/Computer-Organization/blob/3e29198697e272602dc0b8e56f40dca37f9c5904/exercise-1-multiplexer/docs/Multiplexer-Design-and-Modeling-Styles.pdf)

## Exercise 2: Decoders, Encoders, and Demultiplexers

- **The Goal:** Move from single components to complex data routing. Designed a 3:8 decoder, 8:3 priority encoder, and 1:2 demultiplexer to manage bus contention.
- **Key Deliverables:** An interconnected encoder-decoder network analyzing priority behaviors.
- **Links:** 
[View Code & README](https://github.com/EmmanuelC40/Computer-Organization/tree/3e29198697e272602dc0b8e56f40dca37f9c5904/exercise-2-encoder-decoder) | [Read Full Report](https://github.com/EmmanuelC40/Computer-Organization/blob/3e29198697e272602dc0b8e56f40dca37f9c5904/exercise-2-encoder-decoder/docs/Decoders-Encoders-Demultiplexers.pdf)

## Exercise 3: Datapath Design Using LPM Components

- **The Goal:** Combine combinational and sequential logic into a simplified CPU-style architecture using hardware component reuse.
- **Key Deliverables:** 32-bit registers, memory blocks, and an ALU utilizing Intel LPM components.
- **Links:** 
[View Code & README](https://github.com/EmmanuelC40/Computer-Organization/tree/3e29198697e272602dc0b8e56f40dca37f9c5904/exercise-3-datapath) | [Read Full Report](https://github.com/EmmanuelC40/Computer-Organization/blob/3e29198697e272602dc0b8e56f40dca37f9c5904/exercise-3-datapath/docs/Datapath-Design-Using-LPM-Components.pdf)

## Simulation & Verification

**To view and run these files in Quartus Lite:**

1. Clone the repository:

    git clone [https://github.com/EmmanuelC40/Computer-Organization.git](https://github.com/EmmanuelC40/Computer-Organization)

2. Open `Quartus Lite` and click `Open Project`.
3. Look for the target exercise's `/src` or folder directory and click the `QPF File`.
4. To view all files, switch `Project Navigator` from `Hierarchy` to `Files`.

**To run these simulations locally in ModelSim:**

1. Clone the repository:

    git clone [https://github.com/EmmanuelC40/Computer-Organization.git](https://github.com/EmmanuelC40/Computer-Organization)

2. Open `ModelSim` and click the **File** dropdown.
3. Change the directory for `Change Directory` and `Source Directory` to the target exercise's `/src` or folder directory.
4. Click the `Compile` dropdown and compile the source files alongside the corresponding testbench (`*_tb.vhd`).
5. Click the `Simulation` dropdown and start the simulation by choosing the desired testbench.
6. Click and press `ctrl+a` over the signals. Right click and choose `Add To` -> `Wave` -> `Selected Signals` , to view signals in the waveform. 
7. Run the simulation (`run -all`) to view and analyze the waveform outputs. For better visibility, click `View` -> `Zoom` -> `Zoom Full`.

Note: This process applies to all exercises. Furthermore, all designs were verified strictly through simulation frameworks to detect hazards, timing issues, and overflow conditions. They were not synthesized for physical hardware deployment.

## Author

Emmanuel Cano
