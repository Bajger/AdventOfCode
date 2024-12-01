"
A LocationDistanceTest is a test class for testing the behavior of LocationDistance
"
Class {
	#name : 'LocationDistanceTest',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-Tests-AoC2024',
	#package : 'AdventOfCode-Tests',
	#tag : 'AoC2024'
}

{ #category : 'tests' }
LocationDistanceTest >> testCompute [

	|solution|
	solution := LocationDistance new.
	self assert: solution compute equals: 1223326.
	
]

{ #category : 'tests' }
LocationDistanceTest >> testComputeSample [

	|solution|
	solution := LocationDistance new.
	solution input: '3   4
4   3
2   5
1   3
3   9
3   3'.
	self assert: solution compute equals: 11.
	
]
