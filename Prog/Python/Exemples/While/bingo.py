import random
import time
import pyttsx3
#import pywinttypes
#
speaker = pyttsx3.init()
timespeed = 0.5
speaker.setProperty('rate', 100)
speaker.setProperty('voice', 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\Voices\Tokens\TTS_MS_ES-ES_HELENA_11.0')
random.seed()
numeros = list(range(1, 100))
random.shuffle(numeros)
for n in numeros:
    speaker.say(f"El {n}")
    speaker.runAndWait()
    print(n)
    time.sleep(timespeed)

