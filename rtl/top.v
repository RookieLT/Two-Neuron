`define M 8
`define S 8
`define N 8
`define n 16
`define addrwidth_1 3 //(squre root of S) 
`define intbits 6
`define fracbits 10
`define Mn_1 127  //M*n-1
`define Nn_1 127  //N*n-1
`define n_1 15      //n-1

module top(input clk,reset,
            input [`Mn_1 : 0] IN,
            output [`Nn_1: 0] Y);
    
    wire [`addrwidth_1:0] addr_r,addr_c;
    wire finished;
    wire [`Mn_1 : 0] Wr;
    wire [`Nn_1 : 0] Wc;
    wire [`n_1 : 0] H;
    reg [`n_1 : 0] H1;
    always@(posedge clk)begin
        H1<=H;
    end

    ctrl #(`S,`addrwidth_1) ctrl_path(clk,reset,finished,addr_r,addr_c);
    row_weight #(`M,`S,`n,`addrwidth_1) rw(addr_r,Wr);
    column_weight #(`N,`S,`n,`addrwidth_1) cw(addr_c,Wc);
    s1neuron #(`M,`n,`intbits,`fracbits) s1n(IN,Wr,H);
    s2neuron #(`N,`S,`n,`intbits,`fracbits) s2n(H1,Wc,clk,reset,Y);
endmodule
