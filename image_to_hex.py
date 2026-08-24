from PIL import Image
import cv2

# Setup 
image_path = "input_image.jpg"
output_path = "image_hex.txt"

width = 128
height = 128

#2 import image and change to grayscale
gray_image = cv2.imread(image_path,cv2.IMREAD_GRAYSCALE)
if gray_image is None:
    print(f"Error: Could not find '{image_path}'. Make sure the picture is in the same folder as this script!")
    exit()

#3 Resize
res = cv2.resize(gray_image, (width, height));

#4 Extraxt pixel and write hex value
with open(output_path, 'w') as f:
    for row in range(height):
        for col in range(width):
                pixel = res[row, col]
                hex_string = f"{pixel:02x}"
                f.write(hex_string + '\n')
