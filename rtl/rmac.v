module rmac#(parameter S=8,
            parameter  n=32,
            parameter intbits=12,
            parameter fracbits=20)
            (input [n-1:0] W,X,
            input finished,
            input reset,
            output reg [n-1:0] sum);

    wire [n-1:0] WX;
    wire ovf;
    reg [n-1:0]psum;
    multiplier #(n,intbits,fracbits) mult(W,X,WX,ovf);
    always @(WX,posedge reset) begin
        if(reset)
            psum<='b0;
        else
            psum <= WX + psum;
    end
    always @(posedge finished, posedge reset) begin
        if(reset)
            sum<='b0;
        else begin
            if(finished)begin
                if(psum>0)
                    sum <= psum;
                else
                    sum='b0;
            end
        end
    end
endmodule