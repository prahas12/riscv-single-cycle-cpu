module alu_control(

    input [1:0] ALUOp,
    input [2:0] funct3,

    output reg [3:0] ALUControl

);

always @(*)
begin

    case(ALUOp)

        // ADDI, LW, SW
        2'b00:
            ALUControl = 4'b0000;

        // BEQ
        2'b01:
            ALUControl = 4'b0001;

        // R-Type
        2'b10:
        begin
            case(funct3)

                3'b000: ALUControl = 4'b0000; // ADD
                3'b111: ALUControl = 4'b0010; // AND
                3'b110: ALUControl = 4'b0011; // OR
                3'b100: ALUControl = 4'b0100; // XOR

                default:
                    ALUControl = 4'b0000;

            endcase
        end

        default:
            ALUControl = 4'b0000;

    endcase

end

endmodule