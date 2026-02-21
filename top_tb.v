`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2025 03:37:10 PM
// Design Name: 
// Module Name: snake_top_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module snake_top_tb();

reg clk;
reg reset;
reg btn_up;
reg btn_down;
reg btn_left;
reg btn_right;

wire [3:0] vga_r;
wire [3:0] vga_g;
wire [3:0] vga_b;
wire vga_hs;
wire vga_vs;
wire [6:0] seg;
wire [7:0] an;
wire led_r;
wire led_g;

snake_game_top TB(
    .clk(clk),
    .reset(reset),
    .btn_up(btn_up),
    .btn_down(btn_down),
    .btn_left(btn_left),
    .btn_right(btn_right),
    .vga_r(vga_r),
    .vga_g(vga_g),
    .vga_b(vga_b),
    .vga_hs(vga_hs),
    .vga_vs(vga_vs),
    .seg(seg),
    .an(an),
    .led_r(led_r),
    .led_g(led_g)
);

// Clock generation 
    initial clk = 0;
    always #5 clk = ~clk;     

    initial begin
        // Initial conditions
        reset = 1;
        btn_up = 0;
        btn_down = 0;
        btn_left = 0;
        btn_right = 0;

        // Hold reset
        #20;
        reset = 0;

        // Wait for game logic to settle
        #20;

        btn_up = 1;
        #10
        btn_up = 0;

        #10
        btn_right = 1;
        #10
        btn_right = 0;

        #10

        btn_down = 1;
        #100
        btn_down = 0;

        #10


        btn_left = 1;
        #10
        btn_left = 0;

        #50

        $finish;
    end

endmodule

