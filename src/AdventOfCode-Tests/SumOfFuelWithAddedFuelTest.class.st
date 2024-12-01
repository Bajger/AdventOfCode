Class {
	#name : 'SumOfFuelWithAddedFuelTest',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-Tests-AoC2019',
	#package : 'AdventOfCode-Tests',
	#tag : 'AoC2019'
}

{ #category : 'tests' }
SumOfFuelWithAddedFuelTest >> test100756Input [
	self assert: (SumOfFuelWithAddedFuel new input: '100756'; compute) equals: 50346
]

{ #category : 'tests' }
SumOfFuelWithAddedFuelTest >> test14Input [
	self assert: (SumOfFuelWithAddedFuel new input: '14'; compute) equals: 2
]

{ #category : 'tests' }
SumOfFuelWithAddedFuelTest >> test1969Input [
	self assert: (SumOfFuelWithAddedFuel new input: '1969'; compute) equals: 966
]
