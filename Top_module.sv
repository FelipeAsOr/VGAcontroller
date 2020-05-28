`timescale 1ns / 1ps


module Top_module();

bit clk;
bit pxclk;

PixelClock duv(
  .clk(clk),
  .pxclk(pxclk)
  );

always
  #1 clk = !clk;

endmodule
