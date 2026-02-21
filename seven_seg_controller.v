`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2025 12:48:50 PM
// Design Name: 
// Module Name: seven_seg_controller
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
`timescale 1ns / 1ps
module seven_seg_controller(
    input clk,              // 100 MHz clock
    input reset,
    //input alien_switch,
    input [15:0] score,     // Score to display
    output reg [6:0] seg,   // Segment outputs (active low)
    output reg [7:0] an,
    output reg dp           // Decimal point (active low)
);

    
    reg [3:0] digit0, digit1, digit2, digit3;
    reg [3:0] current_digit;

    always @(*) begin
        digit0 = score % 10;
        digit1 = (score / 10) % 10;
        digit2 = (score / 100) % 10;
        digit3 = (score / 1000) % 10;
    end

    
    reg [16:0] refresh_counter;
    wire [1:0] digit_select;

    always @(posedge clk or posedge reset) begin
        if (reset)
            refresh_counter <= 0;
        else
            refresh_counter <= refresh_counter + 1;
    end

    assign digit_select = refresh_counter[16:15];

    
    always @(*) begin
        case (digit_select)
            3'b000: begin an = 8'b11111110; current_digit = digit0; end
            3'b001: begin an = 8'b11111101; current_digit = digit1; end
            3'b010: begin an = 8'b11111011; current_digit = digit2; end
            3'b011: begin an = 8'b11110111; current_digit = digit3; end
            default: begin an = 8'b11111111; current_digit = 4'b0000; end
        endcase
    end

    
    reg dp_temp;
    reg [6:0] tmp_disp_seg;

    always @(*) begin
        dp_temp = 1'b1;
        tmp_disp_seg = 7'b1111111; // all off

//        if (alien_switch == 1) begin
//            case (current_digit)
//                4'h0: begin tmp_disp_seg = 7'b0011110; dp_temp = 0; end
//                4'h1: tmp_disp_seg = 7'b0111100;
//                4'h2: tmp_disp_seg = 7'b1110000;
//                4'h3: begin tmp_disp_seg = 7'b0110100; dp_temp = 0; end
//                4'h4: begin tmp_disp_seg = 7'b1011001; dp_temp = 0; end
//                4'h5: tmp_disp_seg = 7'b1000010;
//                4'h6: begin tmp_disp_seg = 7'b0100010; dp_temp = 0; end
//                4'h7: begin tmp_disp_seg = 7'b0111001; dp_temp = 0; end
//                4'h8: tmp_disp_seg = 7'b0110110;
//                4'h9: begin tmp_disp_seg = 7'b1010010; dp_temp = 0; end
//                default: tmp_disp_seg = 7'b1111111;
//            endcase
//        end
//        else begin
            case (current_digit)
                4'h0: tmp_disp_seg = 7'b1000000;
                4'h1: tmp_disp_seg = 7'b1111001;
                4'h2: tmp_disp_seg = 7'b0100100;
                4'h3: tmp_disp_seg = 7'b0110000;
                4'h4: tmp_disp_seg = 7'b0011001;
                4'h5: tmp_disp_seg = 7'b0010010;
                4'h6: tmp_disp_seg = 7'b0000010;
                4'h7: tmp_disp_seg = 7'b1111000;
                4'h8: tmp_disp_seg = 7'b0000000;
                4'h9: tmp_disp_seg = 7'b0010000;
                default: tmp_disp_seg = 7'b1111111;
            endcase
        end

   
    always @(*) begin
        seg = tmp_disp_seg;
        dp  = dp_temp;
    end

endmodule
