`timescale 1ns / 1ps

module data_memory_tb;

reg clk;
reg MemRead;
reg MemWrite;
reg [31:0] address;
reg [31:0] write_data;

wire [31:0] read_data;

data_memory uut(
    .clk(clk),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .address(address),
    .write_data(write_data),
    .read_data(read_data)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;

    // Write 1234
    MemWrite = 1;
    MemRead  = 0;
    address = 32'd0;
    write_data = 32'd1234;

    #10;

    // Read back
    MemWrite = 0;
    MemRead  = 1;
    address = 32'd0;

    #10;

    $display("Read Data = %d", read_data);

    // Write another value
    MemWrite = 1;
    MemRead  = 0;
    address = 32'd4;
    write_data = 32'd5678;

    #10;

    // Read back
    MemWrite = 0;
    MemRead  = 1;
    address = 32'd4;

    #10;

    $display("Read Data = %d", read_data);

    $finish;
end

endmodule