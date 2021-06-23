module ctrl #(parameter S=8)(
    input clk,
    input reset,
    output reg finished,
    output reg [2:0] addr_r,addr_c
);
    integer state;
    always @(posedge clk) begin
        if(reset) begin
            state<=0;
            finished <= 0;
        end
        else
            if(state <= S+1)begin
                state <= state + 1;
                if(state==S+1)
                    finished <= 1;
            end
    end
    always @(state) begin
        if(state==0)begin
            addr_r<='bx;
            addr_c<='bx;
        end
        else if(state==1)begin
            addr_r<=state-1;
            addr_c<='bx;
        end
        else if(state<=S)begin
            addr_r<=state-1;
            addr_c<=state-2;
        end
        else if(state==S+1) begin
            addr_r <='bx;
            addr_c <=state-2;
        end
    end
endmodule