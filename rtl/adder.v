module adder;

parameter n=16;
parameter intbits=6;
parameter fracbits=10;

function [n-1:0] sum;
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
	end
    sum=res;
end