import argparse
import matplotlib.image as mpimg
import matplotlib.pyplot as plt
import cv2
import numpy as np
def rough():
    greyImage = mpimg.imread('C:\\Users\\shrut\\OneDrive\\Desktop\\final_code\\gray.png', format='png')
    #print(greyImage.shape)
    #img = greyImage[:, :, :3]
    #img = cv2.cvtColor(greyImage, cv2.COLOR_RGBA2RGB)
    markedImage = mpimg.imread('C:\\Users\\shrut\\OneDrive\\Desktop\\final_code\\partial.png', format='png')
    #print(markedImage.shape)
    stacked_img = np.stack((greyImage,)*3, axis=-1)
    #cv2.imwrite('input_wave_108.png',img2*255)

    img2 = np.zeros_like(markedImage)
    img2[:,:,0] = greyImage
    img2[:,:,1] = greyImage
    img2[:,:,2] = greyImage
    cv2.imwrite('input.png', img2*255)
    #print(img2.shape)
