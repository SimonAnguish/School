#!/usr/bin/python
import random
import matplotlib
import copy
import math

import matplotlib.pyplot as plt

def MatrixCreate(rows, columns):
	v = []
	for i in range(rows):
		row = []
		for j in range(columns):
			row.append(0)
		v.append(row)
	return v

def MatrixRandomize(v):
	for x in range(len(v)):
		for y in range(len(v[x])):
			v[x][y] = random.random()
	return v

parent = MatrixCreate(1,50) 
parent = MatrixRandomize(parent) 

#     parentFitness = FitnessParent(parent) 

#     for currentGeneration in range(0,5000):

#          print currentGeneration, parentFitness 

#          child = MatrixPerturb(parent,0.05) 

#          childFitness = Fitness(child) 

#          if ( childFitness > parentFitness ):

#               parent = child 

#               parentFitness = childFitness