`timescale 1ns / 1ps

module control_unit_tb;

reg [6:0] opcode;

wire RegWrite;
wire ALUSrc;
wire MemRead;
wire MemWrite;
wire MemtoReg;
wire Branch;
wire [1:0] ALUOp;

control_unit uut(
    .opcode(opcode),
    .RegWrite(RegWrite),
    .ALUSrc(ALUSrc),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .MemtoReg(MemtoReg),
    .Branch(Branch),
    .ALUOp(ALUOp)
);

initial
begin

    // R-Type
    opcode = 7'b0110011;
    #10;
    $display("R-Type -> RegWrite=%b ALUSrc=%b ALUOp=%b",
              RegWrite, ALUSrc, ALUOp);

    // ADDI
    opcode = 7'b0010011;
    #10;
    $display("ADDI -> RegWrite=%b ALUSrc=%b ALUOp=%b",
              RegWrite, ALUSrc, ALUOp);

    // LW
    opcode = 7'b0000011;
    #10;
    $display("LW -> RegWrite=%b MemRead=%b MemtoReg=%b",
              RegWrite, MemRead, MemtoReg);

    // SW
    opcode = 7'b0100011;
    #10;
    $display("SW -> MemWrite=%b ALUSrc=%b",
              MemWrite, ALUSrc);

    // BEQ
    opcode = 7'b1100011;
    #10;
    $display("BEQ -> Branch=%b ALUOp=%b",
              Branch, ALUOp);

    $finish;
end

endmodule