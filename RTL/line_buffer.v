// line_buffer.v
// Task 2.1 (Assigned to: Youssef)

module line_buffer (
    input  wire       clk,
    input  wire       reset,
    input  wire [7:0] pixel_in,
    input  wire        data_valid_in,

    output wire [7:0] p11,
    output wire [7:0] p12,
    output wire [7:0] p13,
    output wire [7:0] p21,
    output wire [7:0] p22,
    output wire [7:0] p23,
    output wire [7:0] p31,
    output wire [7:0] p32,
    output wire [7:0] p33,
    output wire        window_valid
);
endmodule
