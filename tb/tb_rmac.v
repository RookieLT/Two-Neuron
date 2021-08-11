`timescale 1ns/1ns
module tb_rmac;

//input
reg [15:0] W,X;
reg clk,reset;
//output
wire [15:0] sum;
initial begin
    clk=0;
    forever begin
    #10 clk=!clk;
    end

end
initial begin
    reset = 1;
    #40;
    reset = 0;
    #40;
    W=16'h007a;
    X=16'h0400;
    #20;
    W=16'h0031;
    X=16'h0400;
    #20;
    W=16'h04d7;
    X=16'h0400;
    #20;
    W=16'h83e1;
    X=16'h0400;
    #20;
    W=16'h81cc;
    X=16'h0400;
    #20;
    W=16'h801b;
    X=16'h0400;
    #20;
    W=16'h0040;
    X=16'h0400;
    #20;
    W=16'h020a;
    X=16'h0400;
    #100;
    reset = 1;
    #40;
    reset = 0;
    #40;
    W=16'h007a;
    X=16'h0400;
    #20;
    W=16'h0031;
    X=16'h0400;
    #20;
    W=16'h04d7;
    X=16'h0400;
    #20;
    W=16'h83e1;
    X=16'h0400;
    #20;
    W=16'h81cc;
    X=16'h0400;
    #20;
    W=16'h801b;
    X=16'h0400;
    #20;
    W=16'h0040;
    X=16'h0400;
    #20;
    W=16'h80f5;
    X=16'h0400;
    #20;
end

rmac #(8,16,6,10) dut(W,X,clk,reset,sum); 
endmodule