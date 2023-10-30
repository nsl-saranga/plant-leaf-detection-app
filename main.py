import numpy as np
import cv2
import os

directory_path = 'Maize'

armyworm_imgs_list = []


for filename in os.listdir(directory_path):
    img = cv2.imread(os.path.join(directory_path,filename))
    resized_img = cv2.resize(img, (400, 400))
    armyworm_imgs_list.append(resized_img)

armyworm_imgs = np.array(armyworm_imgs_list)
print(armyworm_imgs[0])

