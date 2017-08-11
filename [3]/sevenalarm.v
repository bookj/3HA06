`timescale 1ns / 1ps

module sevenalarm(
    input clk,
    input enable,
	 input swt,
    output out
    ); 
	 
	reg [15:0] counter;
	always @(posedge clk or posedge swt)
		if(swt)
			counter <= 0;
		else if(enable)
			counter <= counter + 1;
		else 
			counter <= 0;
	
	assign out = counter[15];

endmodule

