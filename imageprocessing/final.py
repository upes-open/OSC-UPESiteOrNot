import cv2 #for image processing
import os #for file directory
import face_recognition
import numpy as np

def checkupesite(image):
    image = np.asarray(bytearray(image), dtype="uint8")
    img=cv2.imdecode(image,0)
    faceCascade = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')
    faces = faceCascade.detectMultiScale(img)
    directory = os.getcwd()+r''
    os.chdir(directory)
    i=1
    for (x, y, w, h) in faces:
            FaceImg = img[y:y+h,x:x+w]
            #To save an image on disk
            filename = 'Face'+'.png'
            cv2.imwrite(os.path.join("extracted" , filename), FaceImg)
            i+=1
    img1 = cv2.imread("extracted/Face.png")
    rgb_img = cv2.cvtColor(img1, cv2.COLOR_BGR2RGB)
    img_encoding = face_recognition.face_encodings(rgb_img)[0] #encodings of the face captured
    c=0
    for j in os.listdir("imagesupesite"):  #checking each image in database
        x="imagesupesite"+"/"+j
        img2 = cv2.imread(x)
        rgb_img2 = cv2.cvtColor(img2, cv2.COLOR_BGR2RGB)
        img_encoding2 = face_recognition.face_encodings(rgb_img2)[0]
        #comparing both images using face encodings
        result = face_recognition.compare_faces([img_encoding], img_encoding2)
        os.remove("extracted/Face.png")
        return result
