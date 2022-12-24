"
A RopeTailPositionsTest is a test class for testing the behavior of RopeTailPositions
"
Class {
	#name : #RopeTailPositionsTest,
	#superclass : #TestCase,
	#category : #'AdventOfCode-Tests-AoC2022'
}

{ #category : #tests }
RopeTailPositionsTest >> testBoundingBoxOfRope [

	|aString tailPositions rect|
	aString := 'R 4
U 4
L 8
D 9'.
	tailPositions := RopeTailPositions new.
	tailPositions input: aString.
	rect := tailPositions boundingBoxOfRope.
	self assert: tailPositions boundingBoxOfRope origin x equals: -4.
	self assert: tailPositions boundingBoxOfRope origin y equals: -5.
	self assert: tailPositions boundingBoxOfRope corner x equals: 4.
	self assert: tailPositions boundingBoxOfRope corner y equals: 4.
]
