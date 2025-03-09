from PIL import Image
import pytesseract

# Path to the screenshot image
screenshot_path = './screen.png'

# Load the image
img = Image.open(screenshot_path)

# Use pytesseract to perform OCR on the image
text = pytesseract.image_to_string(img)

# Print the extracted text (which should contain the video duration)
print("Extracted text:", text)

# If you want to focus on extracting the video duration specifically:
import re
duration_pattern = r"\d{1,2}:\d{2}:\d{2}"  # This matches time format like 00:12:34
duration = re.findall(duration_pattern, text)

if duration:
    print("Extracted video duration:", duration[0])
else:
    print("No duration found")
