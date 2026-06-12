`timescale 1ns / 1ps

module alu_control_tb;

    reg [1:0] ALUOp;
    reg [2:0] funct3;

    wire [3:0] ALUControl;

    // Instantiate ALU Control
    alu_control uut (
        .ALUOp(ALUOp),
        .funct3(funct3),
        .ALUControl(ALUControl)
    );

    initial
    begin

        // ADDI
        ALUOp  = 2'b00;
        funct3 = 3'b000;
        #10;
        $display("ADDI = %b", ALUControl);

        // BEQ
        ALUOp  = 2'b01;
        funct3 = 3'b000;
        #10;
        $display("BEQ = %b", ALUControl);

        // AND
        ALUOp  = 2'b10;
        funct3 = 3'b111;
        #10;
        $display("AND = %b", ALUControl);

        // OR
        ALUOp  = 2'b10;
        funct3 = 3'b110;
        #10;
        $display("OR = %b", ALUControl);

        // XOR
        ALUOp  = 2'b10;
        funct3 = 3'b100;
        #10;
        $display("XOR = %b", ALUControl);

        $finish;

    end

endmodule