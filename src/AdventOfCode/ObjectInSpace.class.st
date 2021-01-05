Class {
	#name : #ObjectInSpace,
	#superclass : #Object,
	#instVars : [
		'orbits',
		'name',
		'orbitHops'
	],
	#category : #'AdventOfCode-day6'
}

{ #category : #'instance creation' }
ObjectInSpace class >> named: aName [

	^ self new name: aName; yourself 
]

{ #category : #'api - accessing' }
ObjectInSpace >> allOrbitHops [
	
	|hops| 
	hops := OrderedCollection new.
	self orbitsRecursivelyDo: self orbitHopsBlock from: hops.
	^ hops
]

{ #category : #'api - accessing' }
ObjectInSpace >> amountOfAllOrbits [
	
	^ self orbitsRecursivelyDo: self amountOfOrbitsBlock from: 0
]

{ #category : #'private ' }
ObjectInSpace >> amountOfOrbitsBlock [

	^ [ :amount | amount + 1 ]

	
]

{ #category : #'api - accessing' }
ObjectInSpace >> findCommonOrbitAncestorOf: anotherObject [

	^ self orbitHops at: (self orbitHops indexOfAnyOf: anotherObject orbitHops) ifAbsent: [ nil ]
	
]

{ #category : #comparing }
ObjectInSpace >> hash [
	^ self name hash
]

{ #category : #'api - accessing' }
ObjectInSpace >> hopsToObject: anAncestorObject [

	^ self orbitHops indexOf: anAncestorObject
]

{ #category : #accessing }
ObjectInSpace >> name [
	^ name
]

{ #category : #accessing }
ObjectInSpace >> name: anObject [
	name := anObject
]

{ #category : #accessing }
ObjectInSpace >> orbitHops [

	orbitHops ifNil: [ self orbitHops: self allOrbitHops  ].
	^orbitHops 
]

{ #category : #accessing }
ObjectInSpace >> orbitHops: aColl [

	orbitHops := aColl
]

{ #category : #'private ' }
ObjectInSpace >> orbitHopsBlock [

	^ [ :collOfObjects :aObject| collOfObjects add: aObject; yourself]
]

{ #category : #accessing }
ObjectInSpace >> orbits [
	^ orbits
]

{ #category : #accessing }
ObjectInSpace >> orbits: anObject [
	orbits := anObject
]

{ #category : #'private ' }
ObjectInSpace >> orbitsRecursivelyDo: aBlock from: aParameter [


	self orbits ifNil: [ ^ aParameter].
	^ self orbits orbitsRecursivelyDo: aBlock from: (aBlock cull: aParameter cull: self orbits)
]

{ #category : #printing }
ObjectInSpace >> printOn: stream [
	super printOn: stream.
	stream nextPut: $(.
	stream nextPutAll: self name.
	stream nextPut: $)
]
