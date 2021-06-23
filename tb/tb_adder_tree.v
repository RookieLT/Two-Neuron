`timescale 1ns/1ns
module tb_adder_tree;

//input
reg [255:0] operand;
//output
wire [31:0] r;

adder_tree  adder(operand,r);

initial begin
    #100;
    operand = {32'b0000_0000_0001_0000_0000_0000_0000_0000,
    32'b0000_0000_0001_1000_0000_0000_0000_0000,
    32'b0000_0000_0001_1100_0000_0000_0000_0000,
    32'b0000_0000_0001_1110_0000_0000_0000_0000,
    32'b0000_0000_0001_1111_0000_0000_0000_0000,
    32'b0000_0000_0001_0000_1000_0000_0000_0000,
    32'b0000_0000_0001_0000_1000_0000_0000_0000,
    32'b0000_0000_0001_0000_1000_0000_0000_0000};
    #1000;
    operand = {32'b0000_0000_0001_0000_0000_0000_0000_0000,
    32'b0000_0000_0001_1000_0000_0000_0000_0000,
    32'b0000_0000_0001_1100_0000_0000_0000_0000,
    32'b0000_0000_0011_1110_0000_0000_0000_0000,
    32'b0000_0000_0111_1111_0000_0000_0000_0000,
    32'b0000_0000_1111_0000_1000_0000_0000_0000,
    32'b0000_0000_0001_1000_1000_0000_0000_0000,
    32'b0000_0000_0001_1100_1000_0000_0000_0000};
end
endmodule