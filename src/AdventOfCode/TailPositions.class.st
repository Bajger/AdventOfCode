"
AoC 2022 - Day 9 part 1	
"
Class {
	#name : #TailPositions,
	#superclass : #AoC2022,
	#instVars : [
		'head',
		'tail',
		'visited'
	],
	#category : #'AdventOfCode-AoC2022'
}

{ #category : #private }
TailPositions >> addTailToVisited [ 

	self visited add: self tail
	
]

{ #category : #'api actions' }
TailPositions >> compute [

	self processMoves.
	^ self visited size
]

{ #category : #private }
TailPositions >> doHeadMovement: aMovement [

	aMovement = 'U' ifTrue: [  self headUp].
	aMovement = 'D' ifTrue: [  self headDown].
	aMovement = 'L' ifTrue: [  self headLeft].
	aMovement = 'R' ifTrue: [  self headRight].

]

{ #category : #private }
TailPositions >> doMovement: aMovement [

	self doHeadMovement: aMovement.
	self updateTailPosition.
	self addTailToVisited.
]

{ #category : #accessing }
TailPositions >> head [

	^ head
]

{ #category : #accessing }
TailPositions >> head: anObject [

	head := anObject
]

{ #category : #private }
TailPositions >> headDown [
	
	self head: self head + (0@(-1))
	
]

{ #category : #private }
TailPositions >> headLeft [
	
	self head: self head + ((-1)@0)
	
]

{ #category : #private }
TailPositions >> headRight [
	
	self head: self head + (1@0)
	
]

{ #category : #private }
TailPositions >> headUp [
	
	self head: self head + (0@1)
]

{ #category : #private }
TailPositions >> incrementForDif: aDif [
	aDif = 0 ifTrue: [ ^ 0 ].
	^ aDif > 0 
			ifTrue: [aDif min: 1 ]
			ifFalse: [ aDif max: -1 ]
]

{ #category : #initialize }
TailPositions >> initialize [

	super initialize.
	self visited: Set new.
	self head: 0@0.
	self initializeTail.
	
]

{ #category : #initialize }
TailPositions >> initializeTail [

	self tail: 0@0	
]

{ #category : #private }
TailPositions >> newTailPosition [
	
	^ self newTailPositionFrom: self head to: self tail
]

{ #category : #private }
TailPositions >> newTailPositionFrom: headPosition to: tailPosition [
	
	(headPosition distanceTo: tailPosition) >= 2 ifTrue: [ 
		|difX difY newX newY|
		difX := headPosition x - (tailPosition x).
		difY := headPosition y - (tailPosition y).	
		newX := tailPosition x + (self incrementForDif: difX).
		newY := tailPosition y + (self incrementForDif: difY).
		^ newX@newY
	].
	^ tailPosition
]

{ #category : #private }
TailPositions >> processMoves [
	|lines|
	lines := (self input splitOn: Character cr) collect: #substrings.
	lines do: [:line | 
		line second asNumber timesRepeat: [ self doMovement: line first ]
	].
]

{ #category : #accessing }
TailPositions >> tail [

	^ tail
]

{ #category : #accessing }
TailPositions >> tail: anObject [

	tail := anObject
]

{ #category : #private }
TailPositions >> updateTailPosition [

	self tail: self newTailPosition

]

{ #category : #accessing }
TailPositions >> visited [

	^ visited
]

{ #category : #accessing }
TailPositions >> visited: anObject [

	visited := anObject
]
