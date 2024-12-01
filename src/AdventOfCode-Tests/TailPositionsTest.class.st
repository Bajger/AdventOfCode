"
A TailPositionsTest is a test class for testing the behavior of TailPositions
"
Class {
	#name : 'TailPositionsTest',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-Tests-AoC2022',
	#package : 'AdventOfCode-Tests',
	#tag : 'AoC2022'
}

{ #category : 'tests' }
TailPositionsTest >> testCompute [

	| tailPositions|
	tailPositions := TailPositions new.
	self assert: tailPositions compute equals: 6284.
]

{ #category : 'tests' }
TailPositionsTest >> testComputeSample [

	|aString tailPositions|
	aString := 'R 4
U 4
L 3
D 1
R 4
D 1
L 5
R 2'.
	tailPositions := TailPositions new.
	tailPositions input: aString.
	self assert: tailPositions compute equals: 13.
]

{ #category : 'tests' }
TailPositionsTest >> testNewTailPosition [

	|tailPosition input|
	input := 
	{ 	{ 0@0. 0@0. 0@0. }. 
    	{ 1@0. 0@0. 0@0.}.
		{ 2@0. 0@0. 1@0.}.	
		{ 0@(-2). 0@0. 0@(-1).}.
		{ 0@0. 1@1. 1@1. }.
		{ 2@1. 0@0. 1@1. }.
		{ 1@2. 0@0. 1@1. }.
		{ (-2)@1. 0@0. (-1)@1. }.
	}.
	tailPosition := TailPositions new.
	input do: [:points | 
		tailPosition head: points first.
		tailPosition tail: points second .
		self assert: tailPosition newTailPosition equals: points third
	]
]
