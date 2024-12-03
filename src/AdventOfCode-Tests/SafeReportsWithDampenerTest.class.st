"
A SafeReportsWithDampenerTest is a test class for testing the behavior of SafeReportsWithDampener
"
Class {
	#name : 'SafeReportsWithDampenerTest',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-Tests-AoC2024',
	#package : 'AdventOfCode-Tests',
	#tag : 'AoC2024'
}

{ #category : 'tests' }
SafeReportsWithDampenerTest >> testCompute [
	|solution|
	solution := SafeReportsWithDampener new.
	self assert: solution compute equals: 476.
]

{ #category : 'tests' }
SafeReportsWithDampenerTest >> testComputeSample [ 
	|solution|
	solution := SafeReportsWithDampener new.
	solution input: '7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9'.
	self assert: solution compute equals: 4.
]
