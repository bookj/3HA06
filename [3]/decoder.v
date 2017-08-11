`timescale 1ns / 1ps

module decoder(
	input [3:0] in,
	output a,
	output b,
	output c,
	output d,
	output e,
	output f,
	output g,
	output dp
	);
	 
	reg [7:0] tmp;

	always @(*)
	begin
		case(in)
			4'b0000 : tmp = 7'b111_1110;
			4'b0001 : tmp = 7'b011_0000;
			4'b0010 : tmp = 7'b110_1101;
			4'b0011 : tmp = 7'b111_1001;
			4'b0100 : tmp = 7'b011_0011;
			4'b0101 : tmp = 7'b101_1011;
			4'b0110 : tmp = 7'b101_1111;
			4'b0111 : tmp = 7'b111_0000;
			4'b1000 : tmp = 7'b111_1111;
			4'b1001 : tmp = 7'b111_1011;
			4'b1010 : tmp = 7'b111_0111;
			4'b1011 : tmp = 7'b001_1111;
			4'b1100 : tmp = 7'b100_1110;
			4'b1101 : tmp = 7'b011_1101;
			4'b1110 : tmp = 7'b100_1111;
			4'b1111 : tmp = 7'b100_0111;
			default : tmp = 7'b000_0000;
		endcase
	end
	
	assign {a, b, c, d, e, f, g} = tmp;
	assign dp = 0;

endmodule
