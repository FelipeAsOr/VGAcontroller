module Vga_controller(
    input pxclk, // Must be 25.175 MHz, which is around 40 ns
    output vga_h_sync,
    output vga_v_sync,
    output reg Display,
    output reg [9:0] Column,
    output reg [9:0] Row
  );
    reg vga_HS, vga_VS;

    initial begin
      Column <= 0;
      Row <= 0;
    end

    // It is defined base on the specifications for a 640 x 480 display with 60Hz
    // Refresh rate
    wire ColumnMaxed = (Column == 800); // 16 + 48 + 96 + 640
    wire RowMaxed = (Row == 525); // 10 + 2 + 33 + 480

    // These blocks allow for the fullfilment of the columns and the rows
    always @(posedge pxclk) begin
    Display <= (Column < 640) && (Row < 480);
    if (ColumnMaxed) begin
        if(RowMaxed)   // The rows begin when the column finishes.
          Row <= 0;
        else
          Row <= Row + 1;
        Column <= 0;
    end
    else
      Column <= Column + 1;
    end


    // This is the block responsible for the sync pulse.
    always @(posedge pxclk)
    begin
      vga_HS <= (Column > (640 + 16) && (Column <= (640 + 16 + 96)));   // active for 96 clocks
      vga_VS <= (Row > (480 + 10) && (Row <= (480 + 10 + 2)));   // active for 2 clocks
    end


    // We assign to the syncs the sync pulse in order of the time.
    assign vga_h_sync = ~vga_HS;
    assign vga_v_sync = ~vga_VS;

endmodule
