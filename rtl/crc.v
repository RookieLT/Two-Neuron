// polynomial: x^8 + x^2 + x^1 + 1
// data width: 8
// convention: the first serial bit is D[7]
module crc( //input clk,reset,
            input [7:0] data,

            output [7:0] newcrc);
    
    wire [7:0] d;
    wire [7:0] c;    
    assign d=data;
    assign c='b0;
        
    assign    newcrc[0] = d[7] ^ d[6] ^ d[0] ^ c[0] ^ c[6] ^ c[7];
    assign    newcrc[1] = d[6] ^ d[1] ^ d[0] ^ c[0] ^ c[1] ^ c[6];
    assign    newcrc[2] = d[6] ^ d[2] ^ d[1] ^ d[0] ^ c[0] ^ c[1] ^ c[2] ^ c[6];
    assign    newcrc[3] = d[7] ^ d[3] ^ d[2] ^ d[1] ^ c[1] ^ c[2] ^ c[3] ^ c[7];
    assign    newcrc[4] = d[4] ^ d[3] ^ d[2] ^ c[2] ^ c[3] ^ c[4];
    assign    newcrc[5] = d[5] ^ d[4] ^ d[3] ^ c[3] ^ c[4] ^ c[5];
    assign    newcrc[6] = d[6] ^ d[5] ^ d[4] ^ c[4] ^ c[5] ^ c[6];
    assign    newcrc[7] = d[7] ^ d[6] ^ d[5] ^ c[5] ^ c[6] ^ c[7];
        

/*    
    reg [7:0] r_newcrc;

    

    always@(posedge clk) begin
        if(reset)begin
            r_newcrc <= 'b0;
        end
        else begin
            r_newcrc[0] <= d[7] ^ d[6] ^ d[0] ^ c[0] ^ c[6] ^ c[7];
            r_newcrc[1] <= d[6] ^ d[1] ^ d[0] ^ c[0] ^ c[1] ^ c[6];
            r_newcrc[2] <= d[6] ^ d[2] ^ d[1] ^ d[0] ^ c[0] ^ c[1] ^ c[2] ^ c[6];
            r_newcrc[3] <= d[7] ^ d[3] ^ d[2] ^ d[1] ^ c[1] ^ c[2] ^ c[3] ^ c[7];
            r_newcrc[4] <= d[4] ^ d[3] ^ d[2] ^ c[2] ^ c[3] ^ c[4];
            r_newcrc[5] <= d[5] ^ d[4] ^ d[3] ^ c[3] ^ c[4] ^ c[5];
            r_newcrc[6] <= d[6] ^ d[5] ^ d[4] ^ c[4] ^ c[5] ^ c[6];
            r_newcrc[7] <= d[7] ^ d[6] ^ d[5] ^ c[5] ^ c[6] ^ c[7];
        end
    end    
    assign newcrc=r_newcrc;*/
endmodule