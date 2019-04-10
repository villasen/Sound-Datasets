import csv
import os
import shutil



source_path = '/Users/martin/machine_learning/8K_Urbansound_dataset/'
target_path = 'Urban8k-Sorted/'

with open(source_path + 'UrbanSound8K.csv', newline='') as csvfile:
  file = csv.DictReader(csvfile)
  for row in file:

    filename = source_path + 'PrepareUrban8K/' + row['slice_file_name']
    classname = row['class']
    print(filename, classname)
    try:
        os.mkdir(target_path + classname)
    except OSError:  
        pass
    shutil.copy(filename, target_path + classname + '/')