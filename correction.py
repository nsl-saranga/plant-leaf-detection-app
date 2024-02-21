import cv2
import os
import shutil
from skimage import io
directory_path = 'Maize/rust'  # Replace with your image directory

# for filename in os.listdir(directory_path):
#     image_path = os.path.join(directory_path, filename)
#
#     with open(image_path, 'rb') as im:
#         im.seek(-2, 2)
#         if im.read() == b'\xff\xd9':
#             print('Image OK :', filename)

for filename in os.listdir(directory_path):
    image_path = os.path.join(directory_path, filename)

    with open(image_path, 'rb') as im:
        try:
            _ = io.imread(image_path)
            img = cv2.imread(image_path)
            # Do stuff with img
        except Exception as e:
            print(e, filename)


