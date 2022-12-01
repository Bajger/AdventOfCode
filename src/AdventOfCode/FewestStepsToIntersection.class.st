"
2019 - day 3 part 2
"
Class {
	#name : #FewestStepsToIntersection,
	#superclass : #CrossedWiresIntersection,
	#instVars : [
		'wireDistance'
	],
	#category : #'AdventOfCode-AoC2019'
}

{ #category : #private }
FewestStepsToIntersection >> addIntersectionBetween: firstWireSegment and: secondWireSegment to: resultColl [
	| aPointOrNil |
	aPointOrNil := firstWireSegment intersectionWith: secondWireSegment.
	aPointOrNil 	ifNotNil: [ :intPoint | 
			|wireDistances|
			wireDistances := self 
				getWireDistancesToIntersection: intPoint 
				firstWireEnd: firstWireSegment end 
				secondWireEnd: secondWireSegment end.
			resultColl add: {intPoint. wireDistances first.  wireDistances last.} ]
]

{ #category : #execution }
FewestStepsToIntersection >> compute [ 

	self addMovesForWires.
	^ self getClosestLengthOfWires: (self handleIntersectionBug: self getIntersections).
]

{ #category : #private }
FewestStepsToIntersection >> doSegmentAction: aBlock  lineSegment: aSegment on: aWire [

	self updateWireDistance: aWire byStep: aSegment length.
	^ super doSegmentAction: aBlock  lineSegment: aSegment on: aWire
]

{ #category : #private }
FewestStepsToIntersection >> getClosestLengthOfWires: intersections [

	^ (intersections collect: [ :aPointColl |  aPointColl second + aPointColl last]) min
]

{ #category : #private }
FewestStepsToIntersection >> getFirstIntersection: intersectionsColl [

	intersectionsColl ifNotEmpty: [ 
		^ intersectionsColl first first
		 ].
	^ nil 
]

{ #category : #initialize }
FewestStepsToIntersection >> getWireDistance: aWire [

	^ self wireDistance at: aWire
	
]

{ #category : #private }
FewestStepsToIntersection >> getWireDistancesToIntersection: intPoint firstWireEnd: firstWireSegmentEnd secondWireEnd: secondWireSegmentEnd [ 
	^ 
	{  
	(self getWireDistance: self firstWire) - (intPoint distanceTo: firstWireSegmentEnd).
	(self getWireDistance: self secondWire) - (intPoint distanceTo: secondWireSegmentEnd).
	}
]

{ #category : #initialize }
FewestStepsToIntersection >> initialize [ 
	super initialize.
	self wireDistance: IdentityDictionary new.
]

{ #category : #initialize }
FewestStepsToIntersection >> initializeWireDistance: aWire [ 

	self wireDistance at: aWire put: 0.
]

{ #category : #private }
FewestStepsToIntersection >> segmentsDo: aBlock on: aWire [

	self initializeWireDistance: aWire.
	^ super segmentsDo: aBlock on: aWire.
]

{ #category : #initialize }
FewestStepsToIntersection >> updateWireDistance: aWire byStep: aStep [

	self wireDistance at: aWire put: (self wireDistance at: aWire) + aStep.
]

{ #category : #accessing }
FewestStepsToIntersection >> wireDistance [
	^ wireDistance
]

{ #category : #accessing }
FewestStepsToIntersection >> wireDistance: anObject [
	wireDistance := anObject
]
