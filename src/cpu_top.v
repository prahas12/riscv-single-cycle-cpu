module cpu_top(

    input clk,
    input reset

);

    // PC Signals
    wire [31:0] pc_current;
    wire [31:0] pc_next;

    // Instruction
    wire [31:0] instruction;

    // Control Signals
    wire RegWrite;
    wire ALUSrc;
    wire MemRead;
    wire MemWrite;
    wire MemtoReg;
    wire Branch;
    wire [1:0] ALUOp;

    // Register File
    wire [31:0] read_data1;
    wire [31:0] read_data2;

    // Immediate
    wire [31:0] immediate;

    // ALU Control
    wire [3:0] ALUControl;

    // ALU
    wire [31:0] alu_result;
    wire zero;

    // ALU Mux
    wire [31:0] alu_input_b;

    //--------------------------------------------------
    // PC
    //--------------------------------------------------

    assign pc_next = pc_current + 4;

    pc PC(
        .clk(clk),
        .reset(reset),
        .next_pc(pc_next),
        .pc_out(pc_current)
    );

    //--------------------------------------------------
    // Instruction Memory
    //--------------------------------------------------

    instruction_memory IM(
        .address(pc_current),
        .instruction(instruction)
    );

    //--------------------------------------------------
    // Control Unit
    //--------------------------------------------------

    control_unit CU(
        .opcode(instruction[6:0]),
        .RegWrite(RegWrite),
        .ALUSrc(ALUSrc),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .MemtoReg(MemtoReg),
        .Branch(Branch),
        .ALUOp(ALUOp)
    );

    //--------------------------------------------------
    // Register File
    //--------------------------------------------------

    register_file RF(
        .clk(clk),
        .we(RegWrite),
        .rs1(instruction[19:15]),
        .rs2(instruction[24:20]),
        .rd(instruction[11:7]),
        .write_data(alu_result),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    //--------------------------------------------------
    // Immediate Generator
    //--------------------------------------------------

    immediate_generator IG(
        .instruction(instruction),
        .immediate(immediate)
    );

    //--------------------------------------------------
    // ALU Control
    //--------------------------------------------------

    alu_control ALUCTRL(
        .ALUOp(ALUOp),
        .funct3(instruction[14:12]),
        .ALUControl(ALUControl)
    );

    //--------------------------------------------------
    // ALU Input Mux
    //--------------------------------------------------

    assign alu_input_b =
        (ALUSrc) ? immediate : read_data2;

    //--------------------------------------------------
    // ALU
    //--------------------------------------------------

    alu ALU(
        .A(read_data1),
        .B(alu_input_b),
        .ALUControl(ALUControl),
        .Result(alu_result),
        .Zero(zero)
    );

endmodule