module multiplier #(parameter n=32, 
                    parameter intbits=12,
                    parameter fracbits=20)
                    (input [n-1:0] a,b,
                    output [n-1:0] result,
                    output reg ovf);
        reg [2*n-1:0] inter_result;
        reg [n-1:0] o_result;
        assign result=o_result;
        always @(a,b) begin
            inter_result=a[n-2:0]*b[n-2:0];
            o_result={a[n-1]^b[n-1],inter_result[n+fracbits-2:fracbits]};
            ovf=(inter_result[2*n-1:n+fracbits-1]>0);
        end
endmodule