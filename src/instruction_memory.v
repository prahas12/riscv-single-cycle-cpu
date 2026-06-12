module instruction_memory(
    input  [31:0] address,
    output [31:0] instruction
);

reg [31:0] memory [0:255];

initial begin

    // Example RISC-V instructions

    memory[0] = 32'h06400093; // addi x1,x0,100
    memory[1] = 32'h0C800113; // addi x2,x0,200
    memory[2] = 32'h002081B3; // add x3,x1,x2

end

assign instruction = memory[address[31:2]];

endmodule