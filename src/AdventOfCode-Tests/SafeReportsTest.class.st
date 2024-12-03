"
A SafeReportsTest is a test class for testing the behavior of SafeReports
"
Class {
	#name : 'SafeReportsTest',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-Tests-AoC2024',
	#package : 'AdventOfCode-Tests',
	#tag : 'AoC2024'
}

{ #category : 'tests' }
SafeReportsTest >> testCompute [
	|solution|
	solution := SafeReports new.
	self assert: solution compute equals: 421.
]

{ #category : 'tests' }
SafeReportsTest >> testComputeSample [ 
	|solution|
	solution := SafeReports new.
	solution input: '7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9'.
	self assert: solution compute equals: 2.
]
