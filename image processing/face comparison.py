#this is to check whether the face detected from the webcam is a upesite or not 
# in which imagesupesite is used as a database
#datasets would be created when we run the face detection program
import cv2, os, face_recognition
img = cv2.imread("datasets/1.png")
rgb_img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
img_encoding = face_recognition.face_encodings(rgb_img)[0]
c=0
for j in os.listdir("imagesupesite"):
    img2 = cv2.imread(j)
    rgb_img2 = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    img_encoding2 = face_recognition.face_encodings(rgb_img2)[0]
    #comparing both images using face encodings
    result = face_recognition.compare_faces([img_encoding], img_encoding2)
    if result==[True]:
        c+=1
if c>=1:
    print("UPESITE")
else:
    print("not an upesite")
#this is to delete the photo from the datasets once it is checked
#that the following student is upesite or not
os.remove("datasets/1.png")
