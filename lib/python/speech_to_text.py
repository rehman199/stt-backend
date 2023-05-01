import speech_recognition as sr
from pydub import AudioSegment
import sys

# load audio file
sound = AudioSegment.from_file(sys.argv[1], format="mp3")
sound.export("audio.wav", format="wav")

# Create a SpeechRecognition recognizer object
r = sr.Recognizer()

# Open the audio file and read the data
with sr.AudioFile("audio.wav") as source:
    audio_data = r.record(source)

# Perform the transcription
try:
    text = r.recognize_google(audio_data)
except sr.UnknownValueError:
    text = "Could not understand audio"
except sr.RequestError as e:
    text = "Could not request results from Google Speech Recognition service; {0}".format(e)

# Print the transcribed text to the standard output
print(text)