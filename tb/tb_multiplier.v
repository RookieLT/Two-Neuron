 `timescale 1ns / 1ns
module tb_multiplier;
    //inputs
    reg [15:0] a,b;
    //outputs
    wire [15:0] result;
    wire ovf;

    //DUT
    multiplier #(16,6,10) mult1 (a,b,result,ovf);
    initial begin
        a=0;
        b=0;
        #100;
        a=16'h0066; //a=0.1
        b=16'h000a; //b=0.01
        #100;
        a=16'h040a; //a=1.01
        b=16'h0600; //b=1.5
        #100;
        a=16'h0866;//a=2.2
        b=16'h8600; //b=-1.5
        #100;
        a=16'h840a; //a=-1.01
        b=16'h8600; //b=-1.5
    end
    

endmodule

