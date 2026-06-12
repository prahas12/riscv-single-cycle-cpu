`timescale 1ns/1ps

module instruction_memory_tb;

reg [31:0] address;
wire [31:0] instruction;

instruction_memory uut(
    .address(address),
    .instruction(instruction)
);

initial begin

    address = 0;
    #10;
    $display("Instr0 = %h", instruction);

    address = 4;
    #10;
    $display("Instr1 = %h", instruction);

    address = 8;
    #10;
    $display("Instr2 = %h", instruction);

    $finish;

end

endmodule