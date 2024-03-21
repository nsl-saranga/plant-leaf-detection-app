import os
from tensorflow.keras.preprocessing.image import ImageDataGenerator, array_to_img, img_to_array, load_img

# Define the path to your dataset
dataset_path = 'weevil'

# Create a directory to store augmented images
augmented_path = 'new_images_aphids'
os.makedirs(augmented_path, exist_ok=True)

# Initialize the ImageDataGenerator for augmentation
datagen = ImageDataGenerator(
    rotation_range=40,
    width_shift_range=0.2,
    height_shift_range=0.2,
    shear_range=0.2,
    zoom_range=0.2,
    horizontal_flip=True,
    fill_mode='nearest'
)

# Loop through each image in the original dataset
for filename in os.listdir(dataset_path):
    img = load_img(os.path.join(dataset_path, filename))
    x = img_to_array(img)
    x = x.reshape((1,) + x.shape)

    # Generate augmented images and save them to the augmented_path
    i = 0
    for batch in datagen.flow(x, batch_size=1, save_to_dir=augmented_path, save_prefix=filename.split('.')[0], save_format='jpeg'):
        i += 1
        if i >= 3:  # Generate two augmented images for each original image
            break

# After running the code, you will have 1000 augmented images in the 'augmented_path' directory.
