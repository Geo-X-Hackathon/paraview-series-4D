# -*- coding: utf-8 -*-
"""
Created on Tue Mar 13 15:30:52 2018

@author: skaiser
"""
import os
from paraview.simple import *

home = raw_input('Enter input: ')
files = os.listdir(home)
files = [ fi for fi in files if  fi.endswith(".tif") ]
tifffiles = []
# timestep = i[8:-4]

for i in files:
    i = home + '/' + i
    print i
    tifffiles.append(i)
 

paraview.simple.TIFFSeriesReader(FileNames = tifffiles)
    
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