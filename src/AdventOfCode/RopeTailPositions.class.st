"
AoC 2022 - Day 9 part 2
"
Class {
	#name : #RopeTailPositions,
	#superclass : #TailPositions,
	#category : #'AdventOfCode-AoC2022'
}

{ #category : #private }
RopeTailPositions >> addTailToVisited [ 

	self visited add: self tail last	
]

{ #category : #initialization }
RopeTailPositions >> announcePositionChanged: newPosition at: index [

	self class announcer announce: 
		(NodePositionChanged new
			newPosition: newPosition;
			nodeIndex: index;
			yourself)
]

{ #category : #initialization }
RopeTailPositions >> announceTailChanged: newPosition [

	self class announcer announce: 
		(TailNodeChanged new
			tailPoint:  newPosition;
			yourself)
]

{ #category : #private }
RopeTailPositions >> boundingBoxOfRope [

	^ Rectangle encompassing: self headMovemenentPoints
]

{ #category : #private }
RopeTailPositions >> doHeadMovement: aMovement [
	
	super doHeadMovement: aMovement.
	self announcePositionChanged: self head at: 1.
]

{ #category : #private }
RopeTailPositions >> headMovemenentPoints [
	|lines points|
	points := Set new.
	points add: self head. 
	lines := (self input splitOn: Character cr) collect: #substrings.
	points addAll: (lines collect: [:line | 
		line second asNumber timesRepeat: [ self doHeadMovement: line first ].
		self head. 
	]).
	self head: 0@0.
	^ points asOrderedCollection 
]

{ #category : #initialization }
RopeTailPositions >> initializeTail [ 

	|tailArray|
	tailArray := Array new: 9.
	tailArray atAllPut: 0@0.
	self tail: tailArray
]

{ #category : #private }
RopeTailPositions >> updateTailPosition [
	
	1 to: self tail size do: [ :idx | self updateTailPositionAt: idx ].
]

{ #category : #private }
RopeTailPositions >> updateTailPositionAt: index [

	| start end newTailPos |
	start := index = 1
		         ifTrue: [ self head ]
		         ifFalse: [ self tail at: index - 1 ].
	end := self tail at: index.
	newTailPos := self newTailPositionFrom: start to: end.
	newTailPos ~= end ifFalse: [ ^ self ].
	self tail at: index put: newTailPos.
	self announcePositionChanged: newTailPos at: index + 1.
	index = self tail size ifTrue: [ self announceTailChanged: end  ]
]
