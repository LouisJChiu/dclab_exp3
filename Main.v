module Main(
	CLK50,
	PAUSE_KEY,
	STOP_KEY,
	RATIO_SW,
	RECORD_SW,
	INTERP_SW,
	NORMAL_SPEED_SW,
	ADCLRCK,
	ADCDAT,
	DACLRCK,
	BCLK,
	MCLK,
	I2C_SCLK,
	I2C_SDAT,
	DACDAT,
	SRAM_ADDR,
	SRAM_WE,
	SRAM_OE,
	SRAM_UB,
	SRAM_LB,
	SRAM_CE,
	SRAM_DATA
);
	input CLK50;
	input PAUSE_KEY;
	input STOP_KEY;
	input RATIO_SW;
	input RECORD_SW;
	input INTERP_SW;
	input NORMAL_SPEED_SW;
	input ADCLRCK;
	input ADCDAT;
	input DACLRCK;
	input BCLK;

	output MCLK;
	output I2C_SCLK;
	output I2C_SDAT;
	output DACDAT;
	output SRAM_ADDR[17:0];
	output SRAM_WE;
	output SRAM_OE;
	output SRAM_UB;
	output SRAM_LB;
	output SRAM_CE;

	inout SRAM_DATA[15:0];

	wire pause;
	State s1(
		.CLK50(CLK50),
		.KEY(PAUSE_KEY),
		.state(pause)
	);

	Clock c1(
		.CLK50(CLK50),
		.ratio(RATIO_SW),
		.isNormalSpeed(NORMAL_SPEED_SW),
		.interp(INTERP_SW),
		.pause(pause),
		.isRecord(RECORD_SW),
		.clkOut(MCLK)
	);
endmodule
