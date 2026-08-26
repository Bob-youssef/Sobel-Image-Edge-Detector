// sobel_math.v
// Task 2.2 (Assigned to: Mohammed)
module sobel_math #(
    parameter THRESHOLD = 100
) (
    input  wire       clk,
    input  wire       reset,

    input  wire [7:0] p11,
    input  wire [7:0] p12,
    input  wire [7:0] p13,
    input  wire [7:0] p21,
    input  wire [7:0] p22,
    input  wire [7:0] p23,
    input  wire [7:0] p31,
    input  wire [7:0] p32,
    input  wire [7:0] p33,
    input  wire        window_valid,

    output reg  [7:0] pixel_out,
    output reg         data_valid_out
);

    // Zero-extend to 9 bits first to do the math in signed 
    wire signed [8:0] s11 = {1'b0, p11};
    wire signed [8:0] s12 = {1'b0, p12};
    wire signed [8:0] s13 = {1'b0, p13};
    wire signed [8:0] s21 = {1'b0, p21};
    wire signed [8:0] s22 = {1'b0, p22};
    wire signed [8:0] s23 = {1'b0, p23};
    wire signed [8:0] s31 = {1'b0, p31};
    wire signed [8:0] s32 = {1'b0, p32};
    wire signed [8:0] s33 = {1'b0, p33};

    // kernels:
    //   Gx = (p13 + 2*p23 + p33) - (p11 + 2*p21 + p31)
    //   Gy = (p11 + 2*p12 + p13) - (p31 + 2*p32 + p33)
    // max is 1020 (needs 11 bits + sign)
    wire signed [11:0] gx = (s13 + (s23 <<< 1) + s33) - (s11 + (s21 <<< 1) + s31);
    wire signed [11:0] gy = (s11 + (s12 <<< 1) + s13) - (s31 + (s32 <<< 1) + s33);

    // Absolute value for the gradient instead of square root 
    wire signed [11:0] abs_gx = gx[11] ? -gx : gx;
    wire signed [11:0] abs_gy = gy[11] ? -gy : gy;
    wire [12:0] magnitude = abs_gx + abs_gy;

   
    wire [7:0] edge_pixel = (magnitude > THRESHOLD) ? 8'hFF : 8'h00;


    always @(posedge clk) begin
        if (reset) begin
            pixel_out      <= 8'h00;
            data_valid_out <= 1'b0;
        end else begin
            pixel_out      <= edge_pixel;
            data_valid_out <= window_valid;
        end
    end

endmodule
