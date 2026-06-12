`timescale 1ns/1ps

module immediate_generator_tb;

reg [31:0] instruction;
wire [31:0] immediate;

immediate_generator uut(

    .instruction(instruction),
    .immediate(immediate)

);

initial
begin

    // ADDI x1,x0,100

    instruction = 32'h06400093;

    #10;

    $display("Immediate = %d", immediate);

    $finish;

end

endmodule