# FPGA iCE40 Open Source Toolchain Project Template

This repository provides a starting template for FPGA projects targeting Lattice iCE40 FPGAs (like the Alchitry Cu) using the open-source toolchain (Yosys, nextpnr, sv2v, Icarus Verilog).

## Features

*   Standard project structure (`src`, `test`, `constraints`, `scripts`).
*   Build script (`scripts/build.sh`) supporting:
    *   SystemVerilog via `sv2v` (`--sv2v` flag).
    *   File lists (`src/_files_synth.f`) for source management.
    *   PCF and SDC constraint merging.
    *   Yosys -> nextpnr -> icepack -> iceprog flow.
*   Simulation script (`scripts/simulate.sh`) supporting:
    *   SystemVerilog via `sv2v` (`--sv2v` flag).
    *   File lists (`src/_files_sim.f`) for source management.
    *   Icarus Verilog compilation and execution.
    *   Includes `test/` directory for test utilities.
    *   Optional GTKWave launch (`--no-viz` to disable).
*   Placeholder files for top-level module, testbench, constraints, and test utilities.

## How to Use

1.  **Create New Repo:** Click the "Use this template" button on GitHub/GitLab or clone/copy this repository manually.
2.  **Rename Constraints:** Rename `constraints/template.pcf` and `constraints/template.sdc` to something project-specific (e.g., `myproject.pcf`, `myproject.sdc`). Update the pin mappings and timing constraints as needed for your hardware and top-level module.
3.  **Update File Lists:** Edit `src/_files_synth.f` and `src/_files_sim.f` to list all your project's source files (`.v`, `.sv`) relative to the repository root. Remember to include necessary utility/package files. Add `test/test_utilities_pkg.sv` to `_files_sim.f`.
4.  **Develop Code:**
    *   Modify/replace `src/top.sv` with your actual top-level module.
    *   Add your design source files (`.sv`/`.v`) to `src/` (and potentially subdirectories like `src/core/`).
    *   Add your testbenches (`_tb.sv`) to `test/`.
    *   Update `test/top_tb.sv` or create new testbenches.
5.  **Build & Simulate:**
    *   Run simulation: `./scripts/simulate.sh [--sv2v] [--tb your_testbench_tb.sv]`
    *   Build and program: `./scripts/build.sh --top <your_top_module_name> [--sv2v]`

## Directory Structure

*   `constraints/`: Pin Constraint Files (`.pcf`) and Synopsys Design Constraints (`.sdc`).
*   `fixtures/`: Data files used by the design/simulation (e.g., memory init `.hex`).
*   `sim/`: GTKWave save files (`.gtkw`).
*   `src/`: Verilog/SystemVerilog source code (`.v`, `.sv`).
    *   `_files_*.f`: File lists for build/simulation.
*   `test/`: Testbenches and simulation utilities.
*   `scripts/`: Build and simulation scripts.
*   `build/`: Generated build/simulation artifacts (ignored by git).

