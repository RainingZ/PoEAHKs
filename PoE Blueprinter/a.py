from PIL import Image, ImageOps
import cv2
import pytesseract
import numpy as np
import os
pytesseract.pytesseract.tesseract_cmd = 'C:\\Program Files\\Tesseract-OCR\\tesseract.exe'
img = cv2.imread('C:\\Users\\Administrator\\Desktop\\PoE Blueprinter\\_0_1_2_3_4.png')
gray = cv2.cvtColor(img, cv2.COLOR_RGB2GRAY)
gray, img_bin = cv2.threshold(gray,128,255,cv2.THRESH_BINARY | cv2.THRESH_OTSU)
gray = cv2.bitwise_not(img_bin)
kernel = np.ones((2, 1), np.uint8)
img = cv2.erode(gray, kernel, iterations=1)
img = cv2.dilate(img, kernel, iterations=1)
cv2.imshow('img', img)
cv2.waitKey(0)
cv2.destroyAllWindows()
out_below = pytesseract.image_to_string(img)
print("OUTPUT:", out_below)