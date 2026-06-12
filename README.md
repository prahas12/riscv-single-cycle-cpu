# Single-Cycle RISC-V CPU

A basic Single-Cycle RISC-V CPU designed using Verilog HDL and simulated in Xilinx Vivado.

This project was developed to gain practical experience in Digital Design, RTL Design, Computer Architecture, and FPGA development workflows.

---

## Project Overview

The processor executes instructions using a single clock cycle per instruction and integrates the fundamental building blocks of a RISC-V CPU.

Implemented modules include:

- Program Counter (PC)
- Instruction Memory
- Control Unit
- Register File
- Immediate Generator
- ALU Control Unit
- Arithmetic Logic Unit (ALU)

---

## Design Architecture

The processor datapath consists of:

1. Instruction Fetch
   - Program Counter
   - Instruction Memory

2. Instruction Decode
   - Control Unit
   - Register File
   - Immediate Generator

3. Execute Stage
   - ALU Control
   - ALU
   - Operand Selection Logic

---

## Folder Structure

```text
single-cycle-riscv-cpu
│
├── src
│   ├── alu.v
│   ├── alu_control.v
│   ├── control_unit.v
│   ├── cpu_top.v
│   ├── data_memory.v
│   ├── immediate_generator.v
│   ├── instruction_memory.v
│   ├── pc.v
│   └── register_file.v
│
├── tb
│   ├── alu_tb.v
│   ├── alu_control_tb.v
│   ├── control_unit_tb.v
│   ├── cpu_top_tb.v
│   ├── data_memory_tb.v
│   ├── immediate_generator_tb.v
│   ├── instruction_memory_tb.v
│   ├── pc_tb.v
│   └── register_file_tb.v
│
└── README.md
```

---

## Tools Used

- Verilog HDL
- Xilinx Vivado 2025.2

---

## Sample Program

```assembly
addi x1, x0, 100
addi x2, x0, 200
add  x3, x1, x2
```

---

## Simulation Result

```text
PC = 80

x1 = 100
x2 = 200
x3 = 300
```

The simulation confirms correct execution of the sample instructions and proper register updates.

---

## Learning Outcomes

Through this project, I gained hands-on experience with:

- Verilog HDL
- RTL Design
- Digital System Design
- Processor Datapath Design
- Computer Architecture Fundamentals
- Vivado Design Flow
- Hardware Simulation and Verification

---

## Future Improvements

- Branch Instruction Support
- Load/Store Integration
- Complete Data Memory Path
- Pipeline Implementation
- FPGA Deployment and Testing

---

## Author
Prahas
Prahas Sharma

Electronics and Communication Engineering (ECE)
