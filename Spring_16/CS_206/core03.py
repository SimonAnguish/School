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
			v[x][y] = random.uniform(-1,1)
	return v	

def MatrixPerturb(p, prob):
	for rows in range(len(p)):
		for columns in range(len(p[rows])):
			if prob > random.random():
				p[rows][columns] = random.random()
	return p

def Fitness(v1):
	desiredNeuronValues = VectorCreate(10)
		
	for j in range(1,10,2):
			desiredNeuronValues[j]=1
			
	fitness = MeanDistance(v1, desiredNeuronValues)
	return fitness

def Fitness2(neuronValues):
	desiredNeuronValues = VectorCreate(10)
		
	for j in range(1,10,2):
			desiredNeuronValues[j]=1
			
	diff=0.0

	for i in range(1,9): 
		for j in range(0,9):
		     diff=diff + abs(neuronValues[i][j]-neuronValues[i][j+1])
		     diff=diff + abs(neuronValues[i+1][j]-neuronValues[i][j]) 

	diff=diff/(2*8*9)
	return diff
	
def PointFive(v):
	for neurons in range(len(v[0])):
		v[0][neurons] = .5
	return v
	
def Update(neuronValues, synapses, i):
	for j in range(len(neuronValues[0])):
		newValue = 0.0
		for k in range(len(synapses)):
			weight = synapses[k][j]
			newValue += weight*neuronValues[i-1][j]
		neuronValues[i][j] = newValue
		if neuronValues[i][j] < 0:
			neuronValues[i][j] = 0
		elif neuronValues[i][j] > 1:
			neuronValues[i][j] = 1
	return neuronValues

def PrintMatrix(matrix):
	for rows in matrix:
		print rows
		
def PlotCheckers(neuronValues):
	plt.imshow(neuronValues, cmap=plt.cm.gray, aspect='auto', interpolation='nearest')
	plt.show()

def VectorCreate(num):
	vector = []
	for count in range(num):
		vector.append(0.0) 
	return vector
	
def MeanDistance(v1, v2):
	distanceSum = 0
	for i in range(len(v1)):
		distanceSum += (v1[0][i]-v2[i])**2
	meanDistance = distanceSum/len(v1)
	return meanDistance
	


def PlotVectorAsLine(fits):
	for x in range(len(fits)):
		plt.plot(x, fits[x],'g.')
	#		plt.plot(x, fits[1][x],'b.')
	#		plt.plot(x, fits[2][x],'r.')
	#		plt.plot(x, fits[3][x],'c.')
	#		plt.plot(x, fits[4][x],'y.')
	plt.show()

parent = MatrixCreate(1, 50) 
parent = MatrixRandomize(parent) 

neuronValues = MatrixCreate(10, 10)
neuronValues = PointFive(neuronValues)

for i in range(1,10):
	neuronValues = Update(neuronValues, parent, i)

actualNeuronValues = neuronValues[9]

fitnessVector = VectorCreate(5000)

neuronValues = MatrixCreate(10, 10)
neuronValues = PointFive(neuronValues)

parent = neuronValues

parentFitness = Fitness(parent) 

for currentGeneration in range(0,5000):
	print currentGeneration, parentFitness 
	fitnessVector[currentGeneration] = parentFitness
	child = copy.deepcopy(parent)
	child = MatrixPerturb(child,0.05) 
	childFitness = Fitness(child) 
	if ( childFitness > parentFitness ):
		parent = child 
		parentFitness = childFitness
		
PlotCheckers(parent)