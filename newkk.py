import os
import cv2

# directory = 'aphids'
directory = 'new'
# directory = 'fall armyworms'
# output_directory = 'resized_fall_armyworms'
output_directory = 'resized_aphids'
# Create the output directory if it doesn't exist
os.makedirs(output_directory, exist_ok=True)

image_num = 78
for filename in os.scandir(directory):
    if filename.is_file() and filename.name.endswith((".jpg", ".jpeg")):
        image_num += 1
        try:
            img = cv2.imread(os.path.join(filename.path))
            if img is not None:
                resized_img = cv2.resize(img, (224, 224))
                image_name = 'aphids' + str(image_num)
                output_file_path = os.path.join(output_directory, f"{image_name}.jpg")
                cv2.imwrite(output_file_path, resized_img)
                print(f"Processed {filename.name} and saved to {output_file_path}")
            else:
                print(f"Error reading {filename.name}: Image is None")
        except Exception as e:
            print(f"Error processing {filename.name}: {e}")

print("Resizing complete.")


