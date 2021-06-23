module s1neuron #(parameter M=8,          //# of input layer
                  parameter n=32,          //# of bits of fixed number 
                  parameter intbits=12,
                  parameter fracbits=20)(
    input [M*n-1:0] X,
    input [M*n-1:0] W,
    output [n-1:0] H
);
    wire [M*n-1:0] WX;
    wire [M-1:0] ovf;
    genvar i;
    generate
        for (i=1;i<=M;i=i+1) begin:gen
            multiplier mul(.a(X[n*i-1 -:n]),
                           .b(W[n*i-1 -:n]),
                           .result(WX[n*i-1 -:n]),
                           .ovf(ovf[i-1])
                            );
        end
    endgenerate
    adder_tree #(8,32,12,20) adder(WX,H);
endmodule