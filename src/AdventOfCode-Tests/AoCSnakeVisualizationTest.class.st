"
An AoCSnakeVisualizationTest is a test class for testing the behavior of AoCSnakeVisualization
"
Class {
	#name : #AoCSnakeVisualizationTest,
	#superclass : #TestCase,
	#category : #'AdventOfCode-Tests-AoC2022'
}

{ #category : #tests }
AoCSnakeVisualizationTest >> testOpen [

	|aString tailPositions|
	tailPositions := RopeTailPositions new.
	(AoCSnakeVisualization from: tailPositions) open.
]

{ #category : #tests }
AoCSnakeVisualizationTest >> testOpenSample [

	|aString tailPositions|
	aString := 'R 4
U 4
L 3
D 1
R 4
D 1
L 5
R 2'.
	tailPositions := RopeTailPositions new.
	tailPositions input: aString.
	(AoCSnakeVisualization from: tailPositions) open.
]

{ #category : #tests }
AoCSnakeVisualizationTest >> testOpenSample2 [

	|aString tailPositions|
	aString := 'R 5
U 8
L 8
D 3
R 17
D 10
L 25
U 20'.
	tailPositions := RopeTailPositions new.
	tailPositions input: aString.
	(AoCSnakeVisualization from: tailPositions) open.
]
