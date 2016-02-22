import random
import matplotlib
import copy

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
	for x in range(len(fits[0])):
		plt.plot(x, fits[0][x],'g.')
#		plt.plot(x, fits[1][x],'b.')
#		plt.plot(x, fits[2][x],'r.')
#		plt.plot(x, fits[3][x],'c.')
#		plt.plot(x, fits[4][x],'y.')
	plt.show()
	
fits = MatrixCreate(1,5000)
	
for hillClimber in range(1):
	parent = MatrixCreate(1, 50) 
	parent = MatrixRandomize(parent) 
	parentFitness = Fitness(parent)
	
	Genes = MatrixCreate(50, 5000)

	for currentGeneration in range(5000):
		for gene in range(len(parent[0])):
			Genes[gene][currentGeneration] = parent[0][gene]
		fits[hillClimber][currentGeneration] = parentFitness
		print currentGeneration, parentFitness 
		child = copy.deepcopy(parent)
		child = MatrixPerturb(child, 0.05) 
		childFitness = Fitness(child) 
		if childFitness > parentFitness:
			parent = child 
			parentFitness = childFitness
			
plt.imshow(Genes, cmap=plt.cm.gray, aspect='auto', interpolation='nearest')
plt.show()
PlotVectorAsLine(fits)

