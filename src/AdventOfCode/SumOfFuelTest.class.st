Class {
	#name : #SumOfFuelTest,
	#superclass : #TestCase,
	#category : #'AdventOfCode-Tests'
}

{ #category : #tests }
SumOfFuelTest >> test100756Input [
	self assert: (SumOfFuel new input: '100756'; compute) equals: 33583
]

{ #category : #tests }
SumOfFuelTest >> test12Input [
	self assert: (SumOfFuel new input: '12'; compute) equals: 2
]

{ #category : #tests }
SumOfFuelTest >> test12and14Input [
	self assert: (SumOfFuel new input: '12 14'; compute) equals: 4
]

{ #category : #tests }
SumOfFuelTest >> test14Input [
	self assert: (SumOfFuel new input: '14'; compute) equals: 2
]

{ #category : #tests }
SumOfFuelTest >> test1969Input [
	self assert: (SumOfFuel new input: '1969'; compute) equals: 654
]
