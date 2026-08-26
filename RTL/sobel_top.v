// sobel_top.v
// Task 3.1 (Assigned to: Marc)

module sobel_top (
    input  wire       clk,
    input  wire       reset,
    input  wire [7:0] pixel_in,
    input  wire        data_valid_in,

    output wire [7:0] pixel_out,
    output wire         data_valid_out
);

    wire [7:0] p11, p12, p13;
    wire [7:0] p21, p22, p23;
    wire [7:0] p31, p32, p33;
    wire        window_valid;

    line_buffer u_line_buffer (
        .clk           (clk),
        .reset         (reset),
        .pixel_in      (pixel_in),
        .data_valid_in (data_valid_in),

        .p11 (p11), .p12 (p12), .p13 (p13),
        .p21 (p21), .p22 (p22), .p23 (p23),
        .p31 (p31), .p32 (p32), .p33 (p33),

        .window_valid (window_valid)
    );

    sobel_math u_sobel_math (
        .clk   (clk),
        .reset (reset),

        .p11 (p11), .p12 (p12), .p13 (p13),
        .p21 (p21), .p22 (p22), .p23 (p23),
        .p31 (p31), .p32 (p32), .p33 (p33),
        .window_valid (window_valid),

        .pixel_out      (pixel_out),
        .data_valid_out (data_valid_out)
    );

endmodule
