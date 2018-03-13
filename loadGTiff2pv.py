# -*- coding: utf-8 -*-
"""
Created on Tue Mar 13 15:30:52 2018

@author: skaiser
"""
import os
from paraview.simple import *

home = '/home/skaiser/Documents/gitdata/GTiff'
files = os.listdir(home)
files = [ fi for fi in files if  fi.endswith(".tif") ]

for i in files:
    print i
    paraview.simple.TIFFReader(FileName= '%s/%s' %(home, i))
    
    