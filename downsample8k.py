import os
import shutil
import librosa
import soundfile

import numpy as np

#filePath = '/Users/martin/machine_learning/github/Sound-Datasets/ESC50-downsampled_silence_dataset/'
filePath = '/Users/martin/machine_learning/DataSets/downsampled-ESC-50-16K/'
#input_dataset = 'Silence-ESC-50/'
input_dataset = 'DataSets/Silence-ESC-50-16K/'
#sample_rate = 8000
sample_rate = 16000


if os.path.exists(filePath):
    shutil.rmtree(filePath , ignore_errors=True)
    
os.chdir('..')
os.chdir(input_dataset)

for root, dirs, files in os.walk('.'):
  label = root.lstrip('./')
  path = filePath + label
  print(path)
  os.mkdir(path)
  for file in files:
    print(file)
    data, sr = librosa.core.load(label + '/' + file, sr=sample_rate, mono=True)
    data.resize(sample_rate)
    librosa.util.fix_length(data, sample_rate)
    soundfile.write( filePath + label + '/' + file, data, sr, 'PCM_16')
