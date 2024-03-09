import numpy as np
import cv2
import os
import tensorflow as tf
from tensorflow import keras
import keras
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
from keras.models import Sequential
from tensorflow.keras.layers import Dense, MaxPooling2D, Conv2D, Flatten
from tensorflow.keras.utils import to_categorical
import matplotlib.pyplot as plt
import pickle

# data preparing
directory_path = 'Maize'
category_names = os.listdir(directory_path)
X_list = []
Y_list = []
for category_name in category_names:
    for filename in os.listdir(directory_path + "/" + category_name):
        if filename.endswith(".jpg"):
            img = cv2.imread(os.path.join(directory_path + "/" + category_name, filename))
            resized_img = cv2.resize(img, (224, 224))
            X_list.append(resized_img)
            Y_list.append(category_name)

if not X_list or not Y_list:
    print("No images found. Please check your directory and file paths.")
    exit()

X = np.array(X_list)
y = np.array(Y_list)

# data preprocessing
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.1, shuffle=True)

if not X_train.any() or not X_test.any():
    print("Empty training or testing set. Please check your dataset.")
    exit()

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
y_train = to_categorical(y_train, num_classes=7)
y_test = to_categorical(y_test, num_classes=7)

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
model.add(Dense(7, activation='softmax'))

# compiling the model.
model.compile(optimizer='adam', loss='categorical_crossentropy', metrics=['accuracy'])
print(model.summary())

# training the model.
history_cnn = model.fit(X_train, y_train, epochs=3, verbose=1, validation_data=(X_test, y_test))

# Save the trained model to a pickle file
model_filename = 'trained_model.pkl'
with open(model_filename, 'wb') as model_file:
    pickle.dump(model, model_file)

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
