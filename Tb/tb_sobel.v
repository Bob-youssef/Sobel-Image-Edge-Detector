// tb_sobel.v
// Task 4.1 (Assigned to: Youssef & Mohammed)

`timescale 1ns / 1ps

module tb_sobel;

    reg        clk;
    reg        reset;
    reg  [7:0] pixel_in;
    reg        data_valid_in;

    wire [7:0] pixel_out;
    wire        data_valid_out;

    //el memory for the i/p image 
    reg [7:0] memory [0:65535];

endmodule
