"
AoC 2022 - Day 2 part 1
"
Class {
	#name : #RockPaperScissors,
	#superclass : #AoC2022,
	#category : #'AdventOfCode-AoC2022'
}

{ #category : #accessing }
RockPaperScissors class >> shapeLetters [

	^ #($A $B $C)
]

{ #category : #'api actions' }
RockPaperScissors >> compute [
	|scores|
	scores := self selectedShapes pairsCollect: [:oppShape :elfShape |
		(self selectedShapeScore: elfShape) + (self roundScoreFor: oppShape and: elfShape) 
		 ].
	^ scores sum
]

{ #category : #private }
RockPaperScissors >> roundScoreFor: opponentShape and: elfShape [
	
	
	|scoreDiff|
	scoreDiff := (self selectedShapeScore: elfShape) - (self selectedShapeScore: opponentShape). 
	"draw"
	scoreDiff isZero ifTrue: [ ^ 3 ].
	
	scoreDiff abs = 1 ifTrue: [ 
		^ scoreDiff > 0 ifTrue: [  6 ] ifFalse: [ 0 ]
	].
	
	scoreDiff abs = 2 ifTrue: [ 
		^ scoreDiff > 0 ifTrue: [  0 ] ifFalse: [ 6 ]
	].
	
]

{ #category : #private }
RockPaperScissors >> selectedShapeScore: aCharacter [ 
	
	|score|
	score := self class shapeLetters indexOf: aCharacter.
	score isZero ifTrue: [ 
		|elfShape|
		elfShape := 	(aCharacter asciiValue - 23) asCharacter.
		^ self class shapeLetters indexOf: elfShape 
	].
	^ score
]

{ #category : #private }
RockPaperScissors >> selectedShapes [

	^ self input substrings collect: #anyOne
]
