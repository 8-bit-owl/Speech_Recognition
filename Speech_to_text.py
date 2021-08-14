# Speech to Text
#--Note - Make sure IBM watson is installed in the machine that is running the program--#
#!pip install ibm_watson

import os
print("Program Start")

from ibm_watson import SpeechToTextV1
from ibm_watson.websocket import RecognizeCallback, AudioSource 
from ibm_cloud_sdk_core.authenticators import IAMAuthenticator
apikey = '51x-ngcakJzHLFpWuui5HJzFxXJRk1pjj3pWearbD0Zd'
url = 'https://api.us-east.speech-to-text.watson.cloud.ibm.com/instances/909ebd47-5e2d-41f3-9cd6-98209ec4a411'

# Setup Service
authenticator = IAMAuthenticator(apikey)
stt = SpeechToTextV1(authenticator=authenticator)
stt.set_service_url(url)
print(stt)
file_path = "./Audiofiles/"
audio_file_list = []
text_file_list = []



"""
Function Name : Speech_to_text
Input  : Audio File (.wav format only)
Output : None
Description : This function sends data to IBM cloud and performs analysis. It takes
              audiofile as an input and writes the text to respective text file.
**Note - Code is written in such a way that there is audio and respective text file will have the same 
file name
"""

def Speech_to_text(audiofile):
    with open(audiofile, 'rb') as f:
            res = stt.recognize(audio=f, content_type='audio/wav', model='en-US_NarrowbandModel', continuous=True).get_result()
            text = ''
            for i in range(len(res['results'])):
                text+=res['results'][i]['alternatives'][0]['transcript']
            text_file = audiofile.replace('.wav','.txt')
            text_object = open(file_path + text_file,"w")
            n = text_object.write(text)
            text_object.close()



"""
Function Name : Convert_folder
Input  : file_path (string)
Output : None
Description : Takes the path of the audiofiles and converts to text if text was not already generated.
"""


def Convert_folder(file_path):
    for file in os.listdir(file_path):
        if ".wav" in file:
            audio_file_list.append(file)
        if '.txt' in file:
            text_file_list.append(file)
    for audiofile in audio_file_list:
        textfile = audiofile.replace('.wav','.txt')
        if textfile not in text_file_list:
            print("performing coversion of",audiofile)
            Speech_to_text(audiofile)
Convert_folder(file_path)
print("Done !")