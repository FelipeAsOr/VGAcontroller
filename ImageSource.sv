module ImageSource(
    input pxclk,
    output reg [7:0] red,
    output reg [7:0] green,
    output reg [7:0] blue,
    output wire hsync_out,
    output wire vsync_out
 );
    wire inDisplayArea;
    wire [9:0] Column;
    wire [9:0] Row;

    Vga_controller hvsync(
      .clk(pxclk),
      .vga_h_sync(hsync_out),
      .vga_v_sync(vsync_out),
      .Column(Column),
      .Row(Row),
      .inDisplayArea(inDisplayArea)
    );

    always @(posedge pxclk)
    begin
      if (inDisplayArea) begin
        if(Column < 214) begin
          if (Row < 160) begin
            red <= 255;
            green <= 0;
            blue <= 0;
          end
        end
      end
      else begin // If it's not to display, go dark
        red <= 0;
        green <= 0;
        blue <= 0;
      end
    end

endmodule
