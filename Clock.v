module Clock(
	clk50,
	ratio,
	isNormalSpeed,
	interp,
	pause,
	isRecord,
	clkOut
);
	reg counter[1:0];
	reg counter2[2:0];
	reg slowClock, slowClock_next;

	if (isNormalSpeed | isRecord | ~interp) begin
		clkOut_tmp = counter[1];
	end else begin
		clkOut_tmp = slowClock;
	end
	assign clkOut = clkOut_tmp | pause;

	always @(posedge clk50) begin
		counter <= counter + 2'b1;
	end


	always @(*) begin
		if (counter2 == ratio) begin
			counter2_next = 3'b0;
			slowClock_next = ~slowClock;
		end else begin
			counter2_next = counter2 + 3'b1;
			slowClock_next = slowClock;
		end		
	end

	always @(posedge counter[0]) begin
		counter2 <= counter2_next;
		slowClock <= slowClock_next;
	end
endmodule