`timescale 1ns/1ns
module adder_tree #(parameter m=8,
                    parameter n=32,
                    parameter intbits=12,
                    parameter fracbits=20 )
                    (
                    input [n*m-1:0] operand,
                    output reg [n-1:0] result
                    );
    
    reg [n-1:0] o_result;
    integer i;
    always @(operand) begin
        
        for(i=0;i<=m;i=i+1) begin
            
            if(i==0)
                o_result=0;
            else
                o_result=o_result+operand[n*i-1 -:n];
            
        end

        if(o_result<0)
            o_result = 0;
        else
            o_result = o_result;
    
        result<=o_result;
    end
    
endmodule