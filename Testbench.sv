`timescale 1ns / 1ps

program Testbench(
  input pxclk,
  input wire Display,
  input wire [9:0] Column,
  input wire [9:0] Row,
  input wire [7:0] red,
  input wire [7:0] green,
  input wire [7:0] blue,
  input wire hsync_out,
  input wire vsync_out
  );


initial begin
  storeValues();
  $display("Finished saving");
  $stop;
end

task ShowValues();
  for(int i=0; i<420000; i++) begin
    @(posedge pxclk)
    $display("We have data for Column : %d, Row: %d, with colors R: %d
    , G: %d, B: %d, and HSync is: %d, VSync is: %d", Column, Row, red,
    green, blue, hsync_out, vsync_out);
  end
endtask:ShowValues

task storeValues();
  int fp;
  fp = $fopen("ValuesOfVGAController.txt", "w");
  for(int i = 0; i <421327; i++)
  begin
    @(posedge pxclk)
    $fdisplay(fp,"We have data for, Column : %d, Row: %d, with colors, R: %d, G: %d, B: %d, and HSync is: %d, VSync is: %d", Column, Row, red,
    green, blue, hsync_out, vsync_out);
  end
  $fclose(fp);
endtask

endprogram
