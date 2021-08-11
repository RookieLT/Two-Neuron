`timescale 1ns/1ns
module tb_crc;

//reg clk,reset;
reg [7:0] data;
wire [7:0] newcrc;

crc dut(data,newcrc);

//initial clk=0;
//always #2 clk=~clk;

initial begin
    //reset = 1;
    #10; //reset = 0;
    data = 8'b0000_0001;
    #10;
    data = 8'b0000_0011;
    #10;
    data = 8'b0000_0010;
    #10;
    data = 8'b0001_1001;
end
endmodule
