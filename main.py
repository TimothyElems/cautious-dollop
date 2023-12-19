import cv2
import numpy as np

def detect_faces(img):
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    if (faces := face_classifier.detectMultiScale(gray, 1.3, 5)) is ():
        return img
