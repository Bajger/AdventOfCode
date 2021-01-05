"
An UniversalOrbitMapTest is a test class for testing the behavior of UniversalOrbitMap
"
Class {
	#name : #UniversalOrbitMapTest,
	#superclass : #TestCase,
	#category : #'AdventOfCode-Tests-AoC2019'
}

{ #category : #'as yet unclassified' }
UniversalOrbitMapTest >> sampleInput [

	^ 'COM)B
B)C
C)D
D)E
E)F
B)G
G)H
D)I
E)J
J)K
K)L'
]

{ #category : #'as yet unclassified' }
UniversalOrbitMapTest >> testPuzzleInput [

	self assert: UniversalOrbitMap new compute equals: 245089
]

{ #category : #'as yet unclassified' }
UniversalOrbitMapTest >> testSampleOrbits [
	| aMap |
	aMap := UniversalOrbitMap new
		input: self sampleInput;
		yourself.
	self assert: aMap compute equals: 42
]
