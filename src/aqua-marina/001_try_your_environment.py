import imageio.v3 as iio
import matplotlib.pyplot as plt
import skimage as ski

# load an image
image = iio.imread(uri='./data/colonies-01.tif')

# rotate it by 45 degrees
rotated = ski.transform.rotate(image=image, angle=45)

# display the original image and its rotated version side by side
fig, ax = plt.subplots(1, 2)
ax[0].imshow(image)
ax[1].imshow(rotated)