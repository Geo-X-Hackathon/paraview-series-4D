# -*- coding: utf-8 -*-
"""
Created on Tue Mar 13 15:30:52 2018

@author: skaiser
"""
import os
from paraview.simple import *
import numpy as np

home = raw_input('Enter input: ')
files = os.listdir(home)
files = [ fi for fi in files if  fi.endswith(".tif") ]
# tiffs = np.zeros(2,len(files))
# print(tiffs)

timesteps = []
tiff_names = []
#tiffs = np.empty([len(files), 2])
#print(tiffs.shape)

count = 0
for i in files:
    #print([i[8:-4] + home + '/' + i])

    #tiffs[count][0] = i[8:-4]
    #tiffs[count][1] = home + '/' + i
    # timesteps.append(float(i[8:-4]))

    tiff_names.append(home + '/' + i)
    count += 1

timesteps = [0, len(files)-1]

#tiffs = {timesteps: tiff_names}

# tiffs = np.array([[files], [timesteps]])
print(tiffs)
paraview.simple.TIFFSeriesReader(FileNames=tiff_names, TimestepValues=timesteps)
    
Show()
Render()
#
## Get the application-wide animation scene
#scene = GetAnimationScene()
#
## Get the animation track for animating "StartTheta" on the active source.
## GetAnimationTrack() creates a new track if none exists.
#cue = GetAnimationTrack("StartTheta")
#
## Create 2 keyframes for the StartTheta track
#keyf0 = CompositeKeyFrame()
#keyf0.Interpolation = 'Ramp'
## At time = 0, value = 0
#keyf0.KeyTime = 0
#keyf0.KeyValues = [0]
#
#keyf1 = CompositeKeyFrame()
## At time = 1.0, value = 200
#keyf1.KeyTime = 1.0
#keyf1.KeyValues = [200]
#
## Add keyframes.
#cue.KeyFrames = [keyf0, keyf1]
#
#scene.Play()