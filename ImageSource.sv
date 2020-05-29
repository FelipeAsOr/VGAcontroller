module ImageSource(
    input pxclk,
    input wire Display,
    input wire [9:0] Column,
    input wire [9:0] Row,
    output reg [7:0] red,
    output reg [7:0] green,
    output reg [7:0] blue,
    output wire hsync_out,
    output wire vsync_out
 );


//    Vga_controller hvsync(
//      .clk(pxclk),
//      .vga_h_sync(hsync_out),
//      .vga_v_sync(vsync_out),
//      .Column(Column),
//      .Row(Row),
//      .Display(Display)
//    );

    always @(posedge pxclk)
    begin
      if (Display) begin
        if(Column <= 160) begin
          if (Row <= 160) begin //First Color
            red <= 255;
            green <= 0;
            blue <= 0;
          end
          if (Row <= 320 && Row > 160) begin //Second Color
            red <= 0;
            green <= 255;
            blue <= 0;
          end
          if (Row <= 480 && Row > 320) begin //Third Color
            red <= 0;
            green <= 0;
            blue <= 255;
          end
        end
        if(Column <= 320 && Column > 160) begin
          if (Row <= 160) begin //Fourth Color
            red <= 255;
            green <= 255;
            blue <= 0;
          end
          if (Row <= 320 && Row > 160) begin //Fifth Color
            red <= 0;
            green <= 255;
            blue <= 255;
          end
          if (Row <= 480 && Row > 320) begin //Sixth Color
            red <= 255;
            green <= 0;
            blue <= 255;
          end
        end
        if(Column <= 480 && Column > 320) begin
          if (Row <= 160) begin //Seventh Color
            red <= 255;
            green <= 0;
            blue <= 255;
          end
          if (Row <= 320 && Row > 160) begin //Eight Color
            red <= 255;
            green <= 255;
            blue <= 0;
          end
          if (Row <= 480 && Row > 320) begin //Ninth Color
            red <= 0;
            green <= 255;
            blue <= 255;
          end
        end
        if(Column <= 640 && Column > 480) begin
            red <= 255; //Thenth color
            green <= 255;
            blue <= 255;
        end
      end
    else begin // If it's not to display, go dark
        red <= 0;
        green <= 0;
        blue <= 0;
    end
  end

endmodule

