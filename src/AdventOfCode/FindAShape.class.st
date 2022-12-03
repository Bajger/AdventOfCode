"
AoC 2022 - Day 2 part 2
"
Class {
	#name : #FindAShape,
	#superclass : #RockPaperScissors,
	#category : #'AdventOfCode-AoC2022'
}

{ #category : #'api actions' }
FindAShape >> compute [
	|scores|
	scores := self selectedShapes pairsCollect: [:oppShape :elfShape |
		|matchingShape|
		matchingShape := self findMatchingShapeFor: oppShape and: elfShape.		
		(self selectedShapeScore: matchingShape) + (self roundScoreFor: oppShape and: matchingShape) 
		 ].
	^ scores sum
]

{ #category : #'api actions' }
FindAShape >> findMatchingShapeFor: oppShape and: elfShape [
	
	| increment idx |
	"-1 = should lose
	  0 = draw
	  1 = should win"
	increment := (self selectedShapeScore: elfShape) - 2.
	idx := (self selectedShapeScore: oppShape) + increment.
	idx < 1 ifTrue: [ idx := 3 ].
	idx > 3 ifTrue: [ idx := 1 ].
	
	^ ((self class shapeLetters at: idx) asciiValue + 23) asCharacter 
]
