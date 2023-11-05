# import cv2
# import os
# import shutil
#
# directory_path = 'Maize/healthy'  # Replace with your image directory
# output_directory = 'Recovered_Images'  # Directory to store the recovered images
#
# if not os.path.exists(output_directory):
#     os.makedirs(output_directory)
#
# for filename in os.listdir(directory_path):
#     image_path = os.path.join(directory_path, filename)
#
#     try:
#         img = cv2.imread(image_path)
#
#         if img is not None:
#             # Image is not corrupted, so just copy it to the output directory
#             output_path = os.path.join(output_directory, filename)
#             shutil.copy(image_path, output_path)
#             print('Image OK:', filename)
#         else:
#             print('Corrupted image:', filename)
#
#     except Exception as e:
#         print(f"Error processing {filename}: {str(e)}")
#
# print(f"Recovered images have been saved in '{output_directory}'.")
import cv2
import os
directory_path = 'Maize/leaf blight'
for filename in os.listdir(directory_path):
    if filename.endswith(".jpg"):
        img = cv2.imread(os.path.join(directory_path, filename))
        resized_img = cv2.resize(img, (400, 400))
