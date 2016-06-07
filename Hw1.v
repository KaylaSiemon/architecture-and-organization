module DECODER(a,b,and0,or0,xor0,not0);
	input a,b;
	output and0, or0, xor0, not0;

	assign and0 = ~a & ~b;
	assign or0 = ~a & b;
	assign xor0 = a & ~b;
	assign not0 = a & b;
endmodule

module COMPU(i0, i1, a, o, x, n);
	input i0, i1;
	output a, o, x, n;

	assign a = i0 & i1;
	assign o = i0 | i1;
	assign x = i0 ^ i1;
	assign n = ~i0;
endmodule

module OPUT(a, o, x, n, and0, or0, xor0, not0, oput);
	input a,o,x,n,and0,or0,xor0,not0;
	output oput;

	assign w0 = a & and0;
	assign w1 = o & or0;
	assign w2 = x & xor0;
	assign w3 = n & not0;

	assign oput = w0 | w1 | w2 | w3;
endmodule

module test;
	wire and0, or0, xor0, not0, a, o, x, n, oput;
	reg i0, i1, i2, i3;

	integer i;

	DECODER decoder(i0, i1, and0, or0, xor0, not0);
	COMPU compu(i2, i3, a, o, x, n);
	OPUT oput0(a, o, x, n, and0, or0, xor0, not0, oput);

	initial
		begin

			for(i=0;i<16;i+=1) begin
			{i0, i1, i2, i3} = i;
			#1
			$display("op code: %b%b operand: %b%b output: %b", i0, i1, i2, i3, oput);
			end
			end
endmodule
