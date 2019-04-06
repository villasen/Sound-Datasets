import os
import librosa
import soundfile
import numpy as np
#os.rmdir('/Users/martin/machine_learning/github/Sound-Datasets/downsampled_dataset/')

os.chdimport os
import librosa
import soundfile
import numpy as np
#os.rmdir('/Users/martin/machine_learning/github/Sound-Datasets/downsampled_dataset/')

os.chdir('Urban8K-Sorted/')

for root, dirs, files in os.walk('.'):
  label = root.lstrip('./')
  path = '/Users/martin/machine_learning/github/Sound-Datasets/downsampled_dataset/' + label
  print(path)
  os.mkdir(path)
  for file in files:
    print(file)
    data, sr = librosa.core.load(label + '/' + file, sr=8000, mono=True)
    data.resize(40000)
    librosa.util.fix_length(data, 40000)
    soundfile.write('/Users/martin/machine_learning/github/Sound-Datasets/downsampled_dataset/' + label + '/' + file, data, sr, 'PCM_16')

#os.chdir('/content/'