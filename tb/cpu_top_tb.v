`timescale 1ns/1ps

module cpu_top_tb;

reg clk;
reg reset;

cpu_top uut(
    .clk(clk),
    .reset(reset)
);

always #5 clk = ~clk;

initial
begin

    clk = 0;
    reset = 1;

    #10;
    reset = 0;

    #200;

    $display("================================");
    $display("PC = %d", uut.pc_current);
    $display("x1 = %d", uut.RF.registers[1]);
    $display("x2 = %d", uut.RF.registers[2]);
    $display("x3 = %d", uut.RF.registers[3]);
    $display("================================");

    $finish;

end

endmodule