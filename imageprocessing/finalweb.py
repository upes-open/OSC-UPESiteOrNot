# Creating database
# It captures images and stores them in datasets
import cv2, sys, numpy, os
import face_recognition
haar_file = 'haarcascade_frontalface_default.xml'

# All the faces data will be
# present this folder
datasets = 'datasets'
path = os.path.join(datasets)
if not os.path.isdir(path):
	os.mkdir(path)

# defining the size of images
(width, height) = (130, 100)
face_cascade = cv2.CascadeClassifier(haar_file)
webcam = cv2.VideoCapture(0)

count = 1
while count < 2:
	(_, im) = webcam.read()
	gray = cv2.cvtColor(im, cv2.COLOR_BGR2GRAY)
	faces = face_cascade.detectMultiScale(gray, 1.3, 4)
	for (x, y, w, h) in faces:
		cv2.rectangle(im, (x, y), (x + w, y + h), (255, 0, 0), 2)
		face = gray[y:y + h, x:x + w]
		face_resize = cv2.resize(face, (width, height))
		cv2.imwrite('% s/% s.png' % (path, count), face_resize)
	count += 1

	cv2.imshow('OpenCV', im)
	key = cv2.waitKey(5)
	if key == 3:
		break
    
img1 = cv2.imread("extracted/Face.png")
rgb_img = cv2.cvtColor(img1, cv2.COLOR_BGR2RGB)
img_encoding = face_recognition.face_encodings(rgb_img)[0]
webcam.release()
for j in os.listdir("imagesupesite"):
    img2 = cv2.imread(j)
    rgb_img2 = cv2.cvtColor(img2, cv2.COLOR_BGR2RGB)
    img_encoding2 = face_recognition.face_encodings(rgb_img2)[0]
    #comparing both images using face encodings
    result = face_recognition.compare_faces([img_encoding], img_encoding2)
    if result==[True]:
        count=1
if count>=1:
    print("UPESITE")
else:
    print("not an upesite")
#this is to delete the photo from the datasets once it is checked
#that the following student is upesite or not
os.remove("datasets/1.png")
