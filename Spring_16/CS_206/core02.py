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
		
def Fitness(v):
	numCount = 0
	sumCount = 0
	for rows in range(len(v)):
		for columns in range(len(v[rows])):
			numCount += 1
			sumCount += v[rows][columns]
	return sumCount/numCount
			
def MatrixPerturb(p, prob):
	for rows in range(len(p)):
		for columns in range(len(p[rows])):
			if prob > random.random():
				p[rows][columns] = random.random()
	return p
	
def PlotVectorAsLine(fits):
	for x in range(len(fits)):
		for y in range(len(fits[x])):
			plt.plot(x, fits[x][y],'g.')
	#		plt.plot(x, fits[1][x],'b.')
	#		plt.plot(x, fits[2][x],'r.')
	#		plt.plot(x, fits[3][x],'c.')
	#		plt.plot(x, fits[4][x],'y.')
	plt.show()

def PlotSynapseConnections(neuronPositions, synapses):
	for neuron in range(len(neuronPositions[0])):
		for otherNeuron in range(len(neuronPositions[0])):
			x1 = neuronPositions[0][neuron]
			x2 = neuronPositions[0][otherNeuron]
			y1 = neuronPositions[1][neuron]
			y2 = neuronPositions[1][otherNeuron]
			
			if synapses[neuron][otherNeuron] < 0:
				w = int(10*abs(synapses[neuron][otherNeuron]))+1
				plt.plot([x1,x2],[y1,y2],color=[0.8,0.8,0.8],linewidth=w)
			else:
				w = int(10*abs(synapses[neuron][otherNeuron]))+1
				plt.plot([x1,x2],[y1,y2],color=[0,0,0],linewidth=w)
		
	plt.show()

def Update(neuronValues, synapses, i):
	for neurons in range(len(neuronValues[i])):
		for new_neuron in range(len(neuronValues[i])):
			neuronValues[i][new_neuron] += synapses[neurons][new_neuron]*neuronValues[i-1][neurons]
	for check_neuron in range(10):
		if neuronValues[i][check_neuron] > 1:
			neuronValues[i][check_neuron] = 1
		elif neuronValues[i][check_neuron] < 0:
			neuronValues[i][check_neuron] = 0
	return neuronValues
#	for j in range(10):
#		for k in range(10):
#			weight = synapses[j][k]
#			neuronValues[i][j] += weight*neuronValues[i-1][k]
#		if neuronValues[i][j] < 0:
#			neuronValues[i][j] = 0
#		elif neuronValues[i][j] > 1:
#			neuronValues[i][j] = 1
#	return neuronValues
	
## CORE 01 TESTING
#fits = MatrixCreate(1,5000)
#	
#for hillClimber in range(1):
#	parent = MatrixCreate(1, 50) 
#	parent = MatrixRandomize(parent) 
#	parentFitness = Fitness(parent)
#	
#	Genes = MatrixCreate(50, 5000)
#
#	for currentGeneration in range(5000):
#		for gene in range(len(parent[0])):
#			Genes[gene][currentGeneration] = parent[0][gene]
#		fits[hillClimber][currentGeneration] = parentFitness
#		print currentGeneration, parentFitness 
#		child = copy.deepcopy(parent)
#		child = MatrixPerturb(child, 0.05) 
#		childFitness = Fitness(child) 
#		if childFitness > parentFitness:
#			parent = child 
#			parentFitness = childFitness
#			
#plt.imshow(Genes, cmap=plt.cm.gray, aspect='auto', interpolation='nearest')
#plt.show()
#PlotVectorAsLine(fits)

neuronValues = MatrixCreate(50,10)
neuronValues = MatrixRandomize(neuronValues)
neuronPositions = MatrixCreate(2, 10)

angle = 0.0

angleUpdate = 2 * math.pi / 10
for i in range(0,10):
	x = math.sin(angle)
	y = math.cos(angle)
	
	neuronPositions[0][i] = x
	neuronPositions[1][i] = y
	
	angle = angle + angleUpdate
	plt.plot(x, y,'ko',markerfacecolor=[1,1,1], markersize=18)
	
synapses = MatrixCreate(10, 10)
for rows in range(len(synapses)):
	for columns in range(len(synapses[0])):
		synapses[rows][columns] = random.uniform(-1,1)
PlotSynapseConnections(neuronPositions, synapses)

for i in range(1,len(neuronValues)):
	neuronValues = Update(neuronValues, synapses, i)
	
plt.imshow(neuronValues, cmap=plt.cm.gray, aspect='auto', interpolation='nearest')
plt.show()
