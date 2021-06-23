`timescale 1ns/1ns
module tb_ctrl;

//input
reg clk,reset;
//output
wire [2:0]addr_c,addr_r;
wire finished;

initial begin
    clk=0;
    forever begin
        #10 clk=!clk;
    end
    
end
initial begin
    reset = 1;
    #50;
    reset = 0;
    #500;
    reset = 1;
    #20;
    reset = 0;
end

ctrl #(8) dut(clk,reset,finished,addr_r,addr_c);
endmodule
