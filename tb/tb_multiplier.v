 `timescale 1ns / 1ns
module tb_multiplier;
    //inputs
    reg [31:0] a,b;
    //outputs
    wire [31:0] result;
    wire ovf;

    //DUT
    multiplier  mult1 (a,b,result,ovf);
    initial begin
        a=0;
        b=0;
        #100;
        a = 32'b00000000001100100100001110010101;
        b = 32'b100000000001_0000_0000_0000_0000_0000;
    end
    
    always @(*)begin
       #10;
        a <= (a<<1)+1;
    end
endmodule

