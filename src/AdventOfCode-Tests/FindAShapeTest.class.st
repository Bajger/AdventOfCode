"
A FindAShapeTest is a test class for testing the behavior of FindAShape
"
Class {
	#name : 'FindAShapeTest',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-Tests-AoC2022',
	#package : 'AdventOfCode-Tests',
	#tag : 'AoC2022'
}

{ #category : 'tests' }
FindAShapeTest >> testCompute [

	|findShape|
	findShape := FindAShape new.
	
	self assert: findShape compute equals: 12429.
]

{ #category : 'tests' }
FindAShapeTest >> testComputeSample [

	|findShape|
	findShape := FindAShape new.
	findShape input: 
'A Y
B X
C Z'.
	self assert: findShape compute equals: 12.
]

{ #category : 'tests' }
FindAShapeTest >> testFindMatchingShapeForAnd [

	|shapeFind|
	shapeFind  := FindAShape new.
	self assert: (shapeFind findMatchingShapeFor: $A and: $X) equals: $Z.
	self assert: (shapeFind findMatchingShapeFor: $A and: $Y) equals: $X.
	self assert: (shapeFind findMatchingShapeFor: $A and: $Z) equals: $Y.

	self assert: (shapeFind findMatchingShapeFor: $B and: $X) equals: $X.
	self assert: (shapeFind findMatchingShapeFor: $B and: $Y) equals: $Y.
	self assert: (shapeFind findMatchingShapeFor: $B and: $Z) equals: $Z.
	
	self assert: (shapeFind findMatchingShapeFor: $C and: $X) equals: $Y.
	self assert: (shapeFind findMatchingShapeFor: $C and: $Y) equals: $Z.
	self assert: (shapeFind findMatchingShapeFor: $C and: $Z) equals: $X.
]
