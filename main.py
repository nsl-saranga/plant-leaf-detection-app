import numpy as np
import cv2
import os
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder

# data preparing
directory_path = 'Maize'
category_names = os.listdir(directory_path)
X_list = []
Y_list = []
for category_name in category_names:
    for filename in os.listdir(directory_path + "/" + category_name):
        if filename.endswith(".jpg"):
            img = cv2.imread(os.path.join(directory_path + "/" + category_name, filename))
            resized_img = cv2.resize(img, (224, 224)) # i had to reduce the image size from (400, 400) to (224,224)
            X_list.append(resized_img)
            Y_list.append(category_name)

X = np.array(X_list)
y = np.array(Y_list)

# data preprocessing
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.1, shuffle=True)

# print(X_train.shape, y_train.shape)

# as we are scaling our RGB from 0 -> 255 to 0 ->1 , it's better we convert X_train and X_test to float.
X_train = X_train.astype('f')
X_test = X_test.astype('f')

# scaling to 0 -> 1
X_train = X_train/255.0
X_test = X_test/255.0

# Label Encoding
label_encoder = LabelEncoder()
y_train = label_encoder.fit_transform(y_train)
y_test = label_encoder.fit_transform(y_test)
# print(X_train)

# Ramitha and Habishek continue the rest from now on. You can refer to the chapter 5 : 2nd and 3rd sub topics
# from the linkeldn video tutoril i sent you. Good luck guys.