
import face_recognition
import os, sys
import cv2
import numpy as np
import math 
import pineconedb

from dotenv import load_dotenv
from encoder import encode
 
 #calls variables from env file
load_dotenv()

client = pineconedb.Pinecone()
   
# this code helps to calculate the confidence threshold of the face
def face_confidence(face_distance, face_match_threshold=0.6):
    range = (1.0 - face_match_threshold)
    linear_val = (1.0 - face_distance) / (range * 2.0)
    

    if face_distance > face_match_threshold:
        return str(round(linear_val * 100, 2)) + '%'
    else:
        value = (linear_val + ((1.0 - linear_val) * math.pow((linear_val - 0.5) * 2, 0.2))) * 100
        return str(round(value, 2)) + '%'
    

"""
fix how image is saved/ queried from the database
error is in this function, we need to find way to  cache the image that is being used 
to query the database with... 

"""
def queryDatabase(face_location, frame):
    # save the face image to a local file
    top,right,bottom,left = face_location
    face_image = frame[top:bottom, left: right]
    cv2.imwrite('face.png', face_image)

    # Encode the image to get the vector embedding
    # This assumes you have a function `encode_image` in `encoder.py` that takes an image file path and returns a vector embedding

    vector_embedding = encode('face.png')

    # Query the Pinecone database
    # This assumes you have a function `query_database` in the Pinecone SDK that takes a vector embedding and returns the name of the most similar vector
    name = client.query_database(vector_embedding)

    return name


class FaceRecognition:
    face_locations = []
    face_names = []
    known_face_encodings = []
    known_face_names = []
    process_current_frame = True

    def run_recognition(self):
        video_capture = cv2.VideoCapture(0)

        if not video_capture.isOpened():
            sys.exit('Video source not found...')

        while True:
            ret, frame = video_capture.read()

            # Only process every other frame of video to save time
            if self.process_current_frame:
                # Resize frame of video to 1/4 size for faster face recognition processing
                small_frame = cv2.resize(frame, (0, 0), fx=0.25, fy=0.25)

                # Convert the image from BGR color (which OpenCV uses) to RGB color (which face_recognition uses)
                rgb_small_frame = cv2.cvtColor(small_frame, cv2.COLOR_BGR2RGB)
                # Find all the faces and face encodings in the current frame of video
                self.face_locations = face_recognition.face_locations(rgb_small_frame)

                self.face_names = []
                for face_location in self.face_locations:
                # Each face_location contains the positions of the top, right, bottom and left edges of the face
                    top, right, bottom, left = face_location
                    print(top,right, bottom, left)
                    

                """ 
                for face_encoding in self.face_encodings:
                    # See if the face is a match for the known face(s)
                    matches = face_recognition.compare_faces(self.known_face_encodings, face_encoding)
                    name = "Unknown"
                    confidence = '???'

                    # Calculate the shortest distance to face
                    face_distances = face_recognition.face_distance(self.known_face_encodings, face_encoding)

                    best_match_index = np.argmin(face_distances)
                    if matches[best_match_index]:
                        name = self.known_face_names[best_match_index]
                        confidence = face_confidence(face_distances[best_match_index])

                    self.face_names.append(f'{name} ({confidence})')


                    

                    INSTRUCTIONS TO BE FOLLOWED:

                    this function will look for the face in the known face encodings and will return the name of the person
                    however we now have a database of faces and we need to query the database to get the name of the person

                    when the face is detected we will get the face encoding and we will query the database to get the name of the person 

                    Detect face  ->  Get face encoding  ->  Query database  ->  Get name of the person

        
                
                """
            # Find all the faces in the current frame of video
            self.face_locations = face_recognition.face_locations(rgb_small_frame)
            print(self.face_locations)

            self.process_current_frame = not self.process_current_frame

            # Display the resulting image
            cv2.imshow('Face Recognition', frame)

            # Hit 'q' on the keyboard to quit!
            if cv2.waitKey(1) == ord('q'):
                break

        # Release handle to the webcam
        video_capture.release()
        cv2.destroyAllWindows()


if __name__ == '__main__':
    fr = FaceRecognition()
    fr.run_recognition()




       
