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

endmodule
