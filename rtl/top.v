module top#(parameter M=8,
            parameter S=8,
            parameter N=8,
            parameter n=32,
            parameter intbits=12,
            parameter fracbits=20)
            (input clk,reset,
            input [M*n-1 : 0] X,
            output [N*n-1 : 0] Y);
    wire [2:0] addr_r,addr_c;
    wire finished;
    wire [M*n-1 : 0] Wr;
    wire [N*n-1 : 0] Wc;
    wire [n-1 : 0] H;
    reg [n-1 : 0] H1;
    always@(posedge clk)begin
        H1<=H;
    end

    ctrl #(S) ctrl_path(clk,reset,finished,addr_r,addr_c);
    row_weight #(M,S,n) rw(addr_r,Wr);
    column_weight #(N,S,n) cw(addr_c,Wc);
    s1neuron #(M,n,intbits,fracbits) s1n(X,Wr,H);
    s2neuron #(N,S,n,intbits,fracbits) s2n(H1,Wc,finished,reset,Y);
endmodule
