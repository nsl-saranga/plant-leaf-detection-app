import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, Dropout, Activation, MaxPooling2D, Conv2D, Flatten, Input
import pickle
from sklearn.model_selection import train_test_split
import numpy as np
import numpy as np
import os
import matplotlib.pyplot as plt
import cv2
from tensorflow.keras.utils import to_categorical


CATEGORIES = ["Blight", "Common_Rust", "Fall_Armyworm", "Gray_Leaf_Spot", "Healthy", "Weevil"]

# data preparing
directory_path = 'Maize'
X_list = []
Y_list = []

for category_name in CATEGORIES:
    category_index = CATEGORIES.index(category_name)
    for filename in os.listdir(os.path.join(directory_path, category_name)):
        if filename.endswith(".jpg"):
            img = cv2.imread(os.path.join(directory_path, category_name, filename))
            resized_img = cv2.resize(img, (224, 224))
            X_list.append(resized_img)
            Y_list.append(category_index)


X = np.array(X_list)
y = np.array(Y_list)

# data preprocessing
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.1, shuffle=True)

# as we are scaling our RGB from 0 -> 255 to 0 ->1 , it's better we convert X_train and X_test to float.
X_train = X_train.astype('f')
X_test = X_test.astype('f')

# scaling to 0 -> 1
X_train = X_train/255.0
X_test = X_test/255.0

# One-hot encode the labels
y_train = to_categorical(y_train, num_classes=6)
y_test = to_categorical(y_test, num_classes=6)

# model definition
model = Sequential()

model.add(Conv2D(32, kernel_size=(3, 3), input_shape=(224, 224, 3), padding="same", activation="relu"))
model.add(MaxPooling2D(pool_size=(2, 2)))

model.add(Conv2D(64, kernel_size=(3, 3), padding='same', activation='relu'))
model.add(MaxPooling2D(pool_size=(2, 2)))

model.add(Conv2D(128, kernel_size=(3, 3), padding='same', activation='relu'))
model.add(MaxPooling2D(pool_size=(2, 2)))

model.add(Flatten())

model.add(Dense(1024, activation='relu'))
model.add(Dense(256, activation='relu'))
model.add(Dense(6, activation='softmax'))

# compiling the model.
model.compile(optimizer='adam', loss='categorical_crossentropy', metrics=['accuracy'])
print(model.summary())

# training the model.
history_cnn = model.fit(X_train, y_train, epochs=3, verbose=1, validation_data=(X_test, y_test))

model_filename = 'trained_model.h5'
model.save(model_filename)

# plot training history
plt.plot(history_cnn.history['accuracy'])
plt.show()
plt.plot(history_cnn.history['val_accuracy'])
plt.show()
plt.plot(history_cnn.history['loss'])
plt.show()
plt.plot(history_cnn.history['val_loss'])
plt.show()

# evaluate the model.
score = model.evaluate(X_test, y_test)
print(score)


