# Introduction

This software is intended for speech recognition, i.e, conversion of speech to text.
The below are the steps to be followed. 

1. Checkout the software using the command 
```
git clone https://github.com/8-bit-owl/Speech_Recognition.git
```
2. Put the audio files that need to be converted to speech in the directory /Audiofiles/

NOTE - Before running the following steps, please follow the section IBM Services.

3. replace the variables apikey and url with the API key and URL obtained from the IBM services.
4. Run the python file Speech_to_text.py
5. The python files should be present in the same directory (/Audiofiles/) in the form of txt files.



# IBM Services

The IBM services provides many software solutions and IBM speech to text is one of them. It uses IBM machine learning models to convert speech to text.
In order to access the cloud services, we need to create an account in IBM cloud website and access the servies. The below are the steps to be followed to create and getting started with IBM cloud servies. 

1. Create an account at https://cloud.ibm.com/login . If you alreaady have an account, thats great.
2. Navigate to https://cloud.ibm.com/catalog/services/speech-to-text
3. Select the geographoc location and select the free plan which allows 500 min of conversion per month.
4. Once the service is successfully created, It will appear under the resources list. 
5. you should be able to see the speech to text serive under the resources list and you should be able to see the API key and URL. 

These variables will be used to replace the variables in the Speech_to_text.py

# Dependencies
1. ibm_watson
2. python 3.8+ (recommended)
The script uses the resources of IBM cloud services. It uses IBM apis and ibm_watson need to be isntalled.
