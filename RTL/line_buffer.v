// line_buffer.v
// Task 2.1 (Assigned to: Youssef)

module line_buffer (
    input  wire       clk,
    input  wire       reset,
    input  wire [7:0] pixel_in,
    input  wire        data_valid_in,

    // i had to change output here to reg since i am assigning in always blcok
    output reg [7:0] p11,
    output reg [7:0] p12, 
    output reg [7:0] p13,
    output reg [7:0] p21,
    output reg [7:0] p22,
    output reg [7:0] p23,
    output reg [7:0] p31,
    output reg [7:0] p32,
    output reg [7:0] p33,
    output wire window_valid
);

reg [7:0] Col_Counter; 
reg [15:0] total_pixel_counter; // this is to know when window is full

// RAM Arrays
reg [7:0] row1_ram [0:255];
reg [7:0] row2_ram [0:255];
wire [7:0] tap1, tap2;

always @(posedge clk) begin
    if (reset) begin
        Col_Counter <= '0;
        total_pixel_counter <= '0; 
    end else if (data_valid_in) begin
        row1_ram [Col_Counter] <= tap2;
        row2_ram [Col_Counter] <= pixel_in;
        Col_Counter <= Col_Counter + 1'b1;

        // top row
        p13 <= tap1;
        p12 <= p13;
        p11 <= p12; 

        // middle row
        p23 <= tap2;
        p22 <= p23;
        p21 <= p22; 
        
        // bottom row
        p33 <= pixel_in;
        p32 <= p33;
        p31 <= p32; 

        if (total_pixel_counter < 16'd515) 
            total_pixel_counter <= total_pixel_counter + 1'b1;  
    end

end
// to read the top and middle pixels of curr column
assign tap1 = row1_ram[Col_Counter]; 
assign tap2 = row2_ram[Col_Counter]; 

assign window_valid = (total_pixel_counter >= 16'd515) ? data_valid_in : 1'b0;

endmodule
