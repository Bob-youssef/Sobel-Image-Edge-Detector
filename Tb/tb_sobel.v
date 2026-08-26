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

    sobel_top uut (
        .clk(clk),
        .reset(reset),
        .pixel_in(pixel_in),
        .data_valid_in(data_valid_in),
        .pixel_out(pixel_out),
        .data_valid_out(data_valid_out)
    );

    integer output_file; // to store output file handler 
    integer i; 

    initial clk = 0; 
    always #5 clk = ~clk; 

    initial begin 
        // i need to step out of the curr dir to get the .txt and write it's output :)
        $readmemh("../image_hex.txt", memory);
        output_file = $fopen("../output_hex.txt", "w");

        clk = 0; reset = 1; pixel_in = 0; data_valid_in = 0; 

        #20 reset = 0; #10; 

        data_valid_in =1;  // turn camera on

        for (i =0; i < 65536; i = i + 1) begin
            pixel_in = memory[i]; 
            #10; 
        end

        data_valid_in =0;  // turn camera off

        #100;


        $fclose(output_file); // close file
    end

    // to catch output
    always @(posedge clk) begin
        if (data_valid_out == 1'b1) begin
            // %02x means write it as a 2-digit lowercase hex number (like Python did!)
            $fwrite(output_file, "%02x\n", pixel_out);
        end
    end

endmodule
