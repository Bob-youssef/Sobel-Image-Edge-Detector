import numpy as np
import cv2

# Setup
input_path = "image_hex.txt"
output_path = "output_image.jpg"

width = 128
height = 128

#2 Read hex values from file
with open(input_path, 'r') as f:
    hex_values = [line.strip() for line in f if line.strip()]

if len(hex_values) != width * height:
    print(f"Error: Expected {width * height} values but found {len(hex_values)} in '{input_path}'.")
    exit()

#3 Convert hex strings back to pixel values
pixels = [int(h, 16) for h in hex_values]

#4 Reshape into image and save
image_array = np.array(pixels, dtype=np.uint8).reshape((height, width))
cv2.imwrite(output_path, image_array)

print(f"Image reconstructed and saved to '{output_path}'.")
