module rmac#(parameter S=8,
            parameter  n=32,
            parameter intbits=12,
            parameter fracbits=20)
            (input [n-1:0] W,X,
            input clk,
            input reset,
            output reg [n-1:0] sum);

    wire [n-1:0] WX;
    wire ovf;
    reg [n-1:0] psum;
    integer cnt;
    multiplier #(n,intbits,fracbits) mult(W,X,WX,ovf);
    always @(posedge clk) begin
        if(reset)begin
            cnt<=0;
        end
        else begin
            if(cnt==0||cnt==1)begin
                psum<=0;
                cnt<=cnt+1;
            end
            else if(cnt<S+2) begin
                psum <= sum_of(WX,psum);
                cnt <= cnt+1;
            end
            else begin
                
                if(psum[n-1])
                    sum <= 'b0;
                else
                sum <= psum;
            end
        end
    end


    function [n-1:0] sum_of;
    input[n-1:0] a,b;
    reg [n-1:0] res;
    begin
    // both negative or both positive
    if(a[n-1] == b[n-1]) begin				
		res[n-2:0] = a[n-2:0] + b[n-2:0];	 	
		res[n-1] = a[n-1];				
	end												
	//	one of them is negative...
	else if(a[n-1] == 0 && b[n-1] == 1) begin		
		if( a[n-2:0] > b[n-2:0] ) begin					
			res[n-2:0] = a[n-2:0] - b[n-2:0];			
			res[n-1] = 0;										
			end
		else begin												
			res[n-2:0] = b[n-2:0] - a[n-2:0];			
			if (res[n-2:0] == 0)
				res[n-1] = 0;										
			else
				res[n-1] = 1;										
			end
		end
	else begin												
		if( a[n-2:0] > b[n-2:0] ) begin					
			res[n-2:0] = a[n-2:0] - b[n-2:0];			
			if (res[n-2:0] == 0)
				res[n-1] = 0;										
			else
				res[n-1] = 1;										
			end
		else begin												
			res[n-2:0] = b[n-2:0] - a[n-2:0];			
			res[n-1] = 0;										
			end
		end
    sum_of=res;
    end
endfunction

endmodule