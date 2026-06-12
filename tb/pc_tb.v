`timescale 1ns/1ps

module pc_tb;

reg clk;
reg reset;
reg [31:0] next_pc;

wire [31:0] pc_out;

pc uut(
    .clk(clk),
    .reset(reset),
    .next_pc(next_pc),
    .pc_out(pc_out)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    reset = 1;
    next_pc = 0;

    #10;
    reset = 0;

    next_pc = 32'd4;
    #10;
    $display("PC = %d", pc_out);

    next_pc = 32'd8;
    #10;
    $display("PC = %d", pc_out);

    next_pc = 32'd12;
    #10;
    $display("PC = %d", pc_out);

    $finish;
end

endmodule