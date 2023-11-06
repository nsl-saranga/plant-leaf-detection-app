import inline
import numpy as np
import cv2
import os
import tensorflow as tf
from tensorflow import keras
import keras
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
from keras.models import Sequential
from keras.layers import Dense, MaxPooling2D, Conv2D, Flatten

from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, Flatten
from tensorflow.keras.utils import to_categorical



# data preparing
directory_path = 'Maize'
category_names = os.listdir(directory_path)
X_list = []
Y_list = []
for category_name in category_names:
    for filename in os.listdir(directory_path + "/" + category_name):
        if filename.endswith(".jpg"):
            img = cv2.imread(os.path.join(directory_path + "/" + category_name, filename))
            resized_img = cv2.resize(img, (224, 224)) # I had to reduce the image size from (400, 400) to (224,224)
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
# from the linkeldn video tutoril I sent you. Good luck guys.
cnn = Sequential()

cnn.add(Conv2D(32,(5,5), input_shape=(224,224,3), padding="same", activation="relu"))
cnn.add(Conv2D(32,(5,5),activation="relu"))
cnn.add(MaxPooling2D(pool_size=(2,2)))
cnn.add(Conv2D(64, kernel_size=(5,5), padding= 'same', activation='relu') )
cnn.add(Conv2D(64,(5,5),activation="relu"))
cnn.add(MaxPooling2D(pool_size=(2,2)))
cnn.add(Flatten())
cnn.add(Dense(1024, activation='relu'))
cnn.add(Dense(10, activation='softmax'))
cnn.compile(optimizer='adam', loss='categorical_crossentroppy', metrics=['accuracy'])
cnn.summary()

#Nural Network Classification
#cnn.fit(X_train, y_train, epochs=10, validation_data=(X_test, y_test))
#cnn.save('maize.h5')

# classification
#model = tf.keras.models.load_model('maize.h5')
#prediction = model.predict(X_test)
#print(prediction)
#print(np.argmax(prediction[0]))
#print(y_test[0])

# Convert labels to one-hot encoding
num_classes = len(np.unique(y))
y_train = to_categorical(y_train, num_classes)
y_test = to_categorical(y_test, num_classes)

# Build the neural network model
model = Sequential()
model.add(Flatten(input_shape=X_train.shape[1:]))
model.add(Dense(128, activation='relu'))
model.add(Dense(num_classes, activation='softmax'))

# Compile the model
model.compile(loss='categorical_crossentropy', optimizer='adam', metrics=['accuracy'])

# Train the model
model.fit(X_train, y_train, epochs=10, batch_size=32, validation_data=(X_test, y_test))

# Evaluate the model
test_loss, test_acc = model.evaluate(X_test, y_test, verbose=2)
print('\nTest accuracy:', test_acc)
