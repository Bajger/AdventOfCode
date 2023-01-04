"
2019 - day 3 part 1
"
Class {
	#name : #CrossedWiresIntersection,
	#superclass : #AoC2019,
	#instVars : [
		'firstWire',
		'secondWire'
	],
	#category : #'AdventOfCode-AoC2019'
}

{ #category : #execution }
CrossedWiresIntersection >> addIntersectionBetween: firstWireSegment and: secondWireSegment to: resultColl [
	| aPointOrNil |
	aPointOrNil := firstWireSegment intersectionWith: secondWireSegment.
	aPointOrNil 	ifNotNil: [ :intPoint | resultColl add: intPoint ] 
]

{ #category : #execution }
CrossedWiresIntersection >> addMovesForWire: aWire withSteps: aWireStepAssocs [
	aWireStepAssocs do: [:wireAssocMovement |
		wireAssocMovement key = #U ifTrue: [ self moveUp: wireAssocMovement value on: aWire ].
		wireAssocMovement key = #D ifTrue: [ self moveDown: wireAssocMovement value on: aWire].
		wireAssocMovement key = #R ifTrue: [ self moveRight: wireAssocMovement value on: aWire].
		wireAssocMovement key = #L ifTrue: [ self moveLeft: wireAssocMovement value on: aWire].
		 ]
]

{ #category : #execution }
CrossedWiresIntersection >> addMovesForWires [
	| wireStrings |
	wireStrings := self input substrings.
	self addMovesForWire: self firstWire withSteps: (self getWireSteps: wireStrings first).
	self addMovesForWire: self secondWire withSteps: (self getWireSteps: wireStrings last).

]

{ #category : #execution }
CrossedWiresIntersection >> compute [ 

	self addMovesForWires.
	^ self getClosestDistance: (self handleIntersectionBug:  self getIntersections)
]

{ #category : #execution }
CrossedWiresIntersection >> doSegmentAction: aBlock  lineSegment: aSegment on: aWire [

	^ aBlock  value: aSegment
]

{ #category : #accessing }
CrossedWiresIntersection >> firstWire [
	^ firstWire
]

{ #category : #accessing }
CrossedWiresIntersection >> firstWire: anObject [
	firstWire := anObject
]

{ #category : #execution }
CrossedWiresIntersection >> getClosestDistance: intersections [

	^ (intersections collect: [ :aPoint |  aPoint abs x + aPoint abs y]) min
]

{ #category : #private }
CrossedWiresIntersection >> getFirstIntersection: intersectionsColl [

	intersectionsColl ifNotEmpty: [ 
		^ intersectionsColl first 
		 ].
	^ nil 
]

{ #category : #execution }
CrossedWiresIntersection >> getIntersections [
	| intersections |
	intersections := OrderedCollection new.
	self segmentsDo: [ :firstWireSegment | 
		self segmentsDo: [ :secondWireSegment | 
			self 
				addIntersectionBetween:firstWireSegment 
				and: secondWireSegment
				to: intersections 
		] on: self secondWire 
	] on: self firstWire.

	^ intersections
]

{ #category : #initialize }
CrossedWiresIntersection >> getNewWire [

	^ PathShape new
      addVertex: 0@0; 
		yourself
]

{ #category : #execution }
CrossedWiresIntersection >> getWireSteps: aWireString [

	^ (aWireString substrings: ',') collect: [:wireStepString |
		wireStepString first asSymbol -> wireStepString asInteger 
		 ]
]

{ #category : #private }
CrossedWiresIntersection >> handleIntersectionBug: intersections [

"this is because of bug in LineSegment>>intersectionWith: method, which returns nil (no intersection), if line segments overlap in same direction"

		(self getFirstIntersection: intersections) = (0@0) ifTrue: [ ^ intersections allButFirst  ].
	^ intersections 
]

{ #category : #initialize }
CrossedWiresIntersection >> initialize [ 
	super initialize.
	self firstWire: self getNewWire.
	self secondWire: self getNewWire.
	
]

{ #category : #execution }
CrossedWiresIntersection >> moveDown: aStep on: aWire [
	|lastPoint|
	lastPoint := aWire vertices last.
	aWire addVertex: (Point x: lastPoint x y: lastPoint y - aStep)
]

{ #category : #execution }
CrossedWiresIntersection >> moveLeft: aStep on: aWire [
	|lastPoint|
	lastPoint := aWire vertices last.
	aWire addVertex: (Point x: lastPoint x - aStep  y: lastPoint y)
]

{ #category : #execution }
CrossedWiresIntersection >> moveRight: aStep on: aWire [
	|lastPoint|
	lastPoint := aWire vertices last.
	aWire addVertex: (Point x: lastPoint x + aStep  y: lastPoint y)
]

{ #category : #execution }
CrossedWiresIntersection >> moveUp: aStep on: aWire [
	|lastPoint|
	lastPoint := aWire vertices last.
	aWire addVertex: (Point x: lastPoint x y: lastPoint y + aStep)
]

{ #category : #accessing }
CrossedWiresIntersection >> secondWire [
	^ secondWire
]

{ #category : #accessing }
CrossedWiresIntersection >> secondWire: anObject [
	secondWire := anObject
]

{ #category : #execution }
CrossedWiresIntersection >> segmentsDo: aBlock on: aWire [

^ aWire segmentsDo: [:point1 :point2 |
		self doSegmentAction: aBlock  lineSegment: (LineSegment from: point1 to: point2) on: aWire
 ]
]
