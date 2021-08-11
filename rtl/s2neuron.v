module s2neuron #(parameter N=8,
                parameter S=8,
                parameter n=32,
                parameter intbits=12,
                parameter fracbits=32)
                (
                input [n-1 : 0] H,
                input [N*n-1 : 0] W,
                input clk,
                input reset,
                output [N*n-1 : 0] Y
                );
    genvar i;
    generate
        for(i=1;i<=N;i=i+1) begin:gen
            rmac #(S,n,intbits,fracbits) mac (.W(W[n*i-1 -:n]),
                                              .X(H),
                                              .clk(clk),
                                              .reset(reset),
                                              .sum(Y[n*i-1 -:n]));
        end
    endgenerate
endmodule