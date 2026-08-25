// sobel_math.v
// Task 2.2 (Assigned to: Mohammed)

module sobel_math #(
    parameter THRESHOLD = 100
) (
    input  wire       clk,
    input  wire       reset,

    input  reg [7:0] p11,
    input  reg [7:0] p12,
    input  reg [7:0] p13,
    input  reg [7:0] p21,
    input  reg [7:0] p22,
    input  reg [7:0] p23,
    input  reg [7:0] p31,
    input  reg [7:0] p32,
    input  reg [7:0] p33,
    input  wire        window_valid,

    output reg  [7:0] pixel_out,
    output reg         data_valid_out
);
endmodule
