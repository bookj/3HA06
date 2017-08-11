`timescale 1ns / 1ps

module top(
	input clk,
	input enable,
	output common1,
	output common2,
	output common3,
	output common4,
	output a,
	output b,
	output c,
	output d,
	output e,
	output f,
	output g,
	output dp,
	output speaker
	);
	 

	reg [21:0] count = 0;
	reg clk_div = 0;

	reg [3:0] countDigit = 4'b1001;	// 9
	reg [3:0] countDigit1 = 4'b0001;	// 1

	always @ (posedge clk)
		if (enable == 0)
			count <= count + 1;
		else
			count <= 0;
	
	always @ (posedge clk)
		if (enable == 0)
			if(count == 22'b1111111111111111111111)
				clk_div <= ~clk_div;

	reg speak = 0;
	reg cm1 = 1;
	reg cm2 = 1;
	always @(posedge clk_div)
		if(enable == 0)
			begin
				 if(countDigit != 0)
					countDigit <= countDigit - 1;
				 else if(countDigit == 0 & countDigit1 != 0)
					 begin
							countDigit <= 4'b1001;
							countDigit1 <= countDigit1 - 1;
					 end
				 else if(countDigit == 0 & countDigit1 == 0)
					 speak <= 1;
			end
		else 
			begin 
				countDigit <= 4'b1001;
				countDigit1 <= 4'b1001;
				speak <= 0;
			end
//////////////////////////////////////////////////////////////////////////
	reg [15:0] count1 = 0;

	always @ (posedge clk)
		begin
			if (enable == 0)
				count1 <= count1 + 1;
			else
				count1 <= 0;
		end
		
	reg clk_div1 = 0;
	always @(posedge clk)
		if(enable == 0)
			if(count1 == 16'b1111111111111111)
				clk_div1 <= ~clk_div1;
		

	reg [3:0] countDigitShow = 0;
	 always @ (*)
		 if (enable == 0)
			 begin
				 if(clk_div1 == 1'b1)
					 begin
						 countDigitShow <= countDigit;
						 cm1 <= 0;
						 cm2 <= 1;
					 end
				 else
					 begin
						 countDigitShow <= countDigit1;
						 cm1 <= 1;
						 cm2 <= 0;
					 end
			 end
	
	 assign common1 = cm1;
	 assign common2 = cm2;
	 assign common3 = 1;
	 assign common4 = 1;
	 decoder d1(countDigitShow, a, b, c, d, e, f, g, dp);
	 sevenalarm s1 (clk, speak, enable, speaker);


endmodule
