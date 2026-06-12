`timescale 1ns / 1ps

module alu_tb;

reg  [31:0] A;
reg  [31:0] B;
reg  [3:0]  ALUControl;

wire [31:0] Result;
wire Zero;

// Instantiate ALU

alu uut(
    .A(A),
    .B(B),
    .ALUControl(ALUControl),
    .Result(Result),
    .Zero(Zero)
);

initial
begin

    A = 20;
    B = 10;

    // ADD
    ALUControl = 4'b0000;
    #10;
    $display("ADD = %d", Result);

    // SUB
    ALUControl = 4'b0001;
    #10;
    $display("SUB = %d", Result);

    // AND
    ALUControl = 4'b0010;
    #10;
    $display("AND = %d", Result);

    // OR
    ALUControl = 4'b0011;
    #10;
    $display("OR  = %d", Result);

    // XOR
    ALUControl = 4'b0100;
    #10;
    $display("XOR = %d", Result);

    // SLT
    ALUControl = 4'b0101;
    #10;
    $display("SLT = %d", Result);

    // Zero Flag Test
    A = 15;
    B = 15;
    ALUControl = 4'b0001;
    #10;

    $display("Result = %d", Result);
    $display("Zero   = %b", Zero);

    $finish;

end

endmodule