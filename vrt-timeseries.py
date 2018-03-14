# -*- coding: utf-8 -*-
"""
Created on Tue Mar 13 15:30:52 2018

@author: skaiser
"""
import os
from paraview.simple import *


input_vrt = raw_input('VRT file: ')

paraview.simple.ProStarReader(FileName=input_vrt)

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