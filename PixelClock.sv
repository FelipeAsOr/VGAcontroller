`timescale 1ns / 1ps

program PixelClock (
    input wire clk,
    output logic pxclk
  );

int count = 0;
//int othercount = 0;

initial begin
  pxclk = 0;
  forever@(posedge clk) begin
    CountForPixelClk();
//  othercount += 1;
//  if(othercount == 20)
//    break;
  end
end

task CountForPixelClk();
  if(count == 40) begin
    pxclk = !pxclk;
    count = 0;
  end
  count += 1;
  //$display("The clock is at: %d", pxclk);
endtask : CountForPixelClk

endprogram
