Class {
	#name : 'AmplificationCircuitTest',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-Tests-AoC2019',
	#package : 'AdventOfCode-Tests',
	#tag : 'AoC2019'
}

{ #category : 'tests' }
AmplificationCircuitTest >> testAoCSample [

	|aCircuit | 
	aCircuit := AmplificationCircuit new 
		input: '3,15,3,16,1002,16,10,16,1,16,15,15,4,15,99,0,0';
		yourself. 
	aCircuit resetAmps.
	self assert: (aCircuit runCircuitForPhaseSettings: #(4 3 2 1 0); lastAmpOutput) equals: 43210.
	

	aCircuit input: '3,23,3,24,1002,24,10,24,1002,23,-1,23,101,5,23,23,1,24,23,23,4,23,99,0,0'.
	aCircuit resetAmps.
	self assert: (aCircuit runCircuitForPhaseSettings: #(0 1 2 3 4); lastAmpOutput) equals: 54321.
	
	aCircuit input: '3,31,3,32,1002,32,10,32,1001,31,-2,31,1007,31,0,33,1002,33,7,33,1,33,31,31,1,32,31,31,4,31,99,0,0,0'.
	aCircuit resetAmps.
	self assert: (aCircuit runCircuitForPhaseSettings: #(1 0 4 3 2); lastAmpOutput) equals: 65210.
	
]

{ #category : 'tests' }
AmplificationCircuitTest >> testCompute [

	self assert: (AmplificationCircuit new compute) equals: 51679
]
