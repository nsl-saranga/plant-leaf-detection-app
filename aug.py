from tensorflow.keras.preprocessing.image import ImageDataGenerator
import os
import cv2

original_folder = 'resized_fall_armyworms'
augmented_folder = 'augmented_fall_armyworms'
os.makedirs(augmented_folder, exist_ok=True)

augmentation_datagen = ImageDataGenerator(
    rotation_range=40,
    width_shift_range=0.2,
    height_shift_range=0.2,
    shear_range=0.2,
    zoom_range=0.2,
    horizontal_flip=True,
    fill_mode='nearest'
)
image_num = 1
for filename in os.listdir(original_folder):
    img = cv2.imread(os.path.join(original_folder, filename))
    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    img = img.reshape((1,) + img.shape)
    i = 0
    for batch in augmentation_datagen.flow(img, batch_size=1, save_to_dir=augmented_folder, save_prefix="fall_armyworm" + str(image_num),
                                           save_format='jpg'):
        i += 1
        if i >= 10:  # Generate 10 augmented images for each original image
            break
        image_num += 1

