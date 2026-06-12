module alu(

    input  [31:0] A,
    input  [31:0] B,
    input  [3:0]  ALUControl,

    output reg [31:0] Result,
    output Zero

);

always @(*)
begin
    case(ALUControl)

        4'b0000: Result = A + B;                     // ADD
        4'b0001: Result = A - B;                     // SUB
        4'b0010: Result = A & B;                     // AND
        4'b0011: Result = A | B;                     // OR
        4'b0100: Result = A ^ B;                     // XOR
        4'b0101: Result = (A < B) ? 32'd1 : 32'd0;  // SLT

        default: Result = 32'd0;

    endcase
end

assign Zero = (Result == 32'd0);

endmodule