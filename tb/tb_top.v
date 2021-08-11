`timescale 1ns/1ns
module tb_top;

//input
reg clk,reset;
reg [127:0] X;
//output
wire [127:0] Y;
top TP(clk,reset,X,Y);
initial begin
    clk=0;
    forever begin
        #5 clk=!clk;
    end
end
initial begin
    reset =1;
    #20;
    reset=0;
    #300;
    reset =1;
    #20;
    reset=0;
end
initial begin
    X =  {16'h0400,
        16'h0400,
        16'h0400,
        16'h0400,
        16'h0400,
        16'h0400,
        16'h0400,
        16'h0400};
    #300;
   X =  {16'h0400,
        16'h0000,
        16'h0400,
        16'h0400,
        16'h0400,
        16'h0400,
        16'h0400,
        16'h0400};
end
endmodule