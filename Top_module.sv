`timescale 1ns / 1ps


module Top_module();

bit clk;
bit pxclk;

wire [9:0] Column, Row;
wire [7:0] red, blue, green;
wire hsync_out, vsync_out;
wire Display;

PixelClock duv(
  .clk(clk),
  .pxclk(pxclk)
  );

Vga_controller hvsync(
  .pxclk(pxclk),
  .vga_h_sync(hsync_out),
  .vga_v_sync(vsync_out),
  .Column(Column),
  .Row(Row),
  .Display(Display)
  );

ImageSource image(
  .pxclk(pxclk),
  .Display(Display),
  .Column(Column),
  .Row(Row),
  .red(red),
  .green(green),
  .blue(blue),
  .hsync_out(hsync_out),
  .vsync_out(vsync_out)
  );

Testbench tb(
  .pxclk(pxclk),
  .Display(Display),
  .Column(Column),
  .Row(Row),
  .red(red),
  .green(green),
  .blue(blue),
  .hsync_out(hsync_out),
  .vsync_out(vsync_out)
  );

always
  #1 clk = !clk;

endmodule
