module immediate_generator(

    input  [31:0] instruction,
    output reg [31:0] immediate

);

always @(*)
begin

    case(instruction[6:0])

        // I-Type (ADDI)

        7'b0010011:
        begin
            immediate = {{20{instruction[31]}},
                         instruction[31:20]};
        end

        default:
        begin
            immediate = 32'd0;
        end

    endcase

end

endmodule