Class {
	#name : #FewestStepsToIntersection,
	#superclass : #CrossedWiresIntersection,
	#instVars : [
		'wireDistance'
	],
	#category : #AdventOfCode
}

{ #category : #private }
FewestStepsToIntersection >> addIntersectionBetween: firstWireSegment and: secondWireSegment to: resultColl [
	| aPointOrNil |
	aPointOrNil := firstWireSegment intersectionWith: secondWireSegment.
	aPointOrNil 	ifNotNil: [ :intPoint | 
			self getDistanceToIntersection: intPoint firstWireEnd: firstWireSegment end secondWireEnd: secondWireSegment end.
			resultColl add: intPoint ]
]

{ #category : #private }
FewestStepsToIntersection >> doSegmentAction: aBlock lineSegment: aSegment on: aWire [

	self updateWireDistance: aWire byStep: aSegment length.
	^ super doSegmentAction: aBlock lineSegment: aSegment on: aWire
]

{ #category : #initialize }
FewestStepsToIntersection >> getWireDistance: aWire [

	^ self wireDistance at: aWire
	
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