Class {
	#name : #ObjectInSpace,
	#superclass : #Object,
	#instVars : [
		'orbits',
		'name'
	],
	#category : #'AdventOfCode-day6'
}

{ #category : #'instance creation' }
ObjectInSpace class >> named: aName [

	^ self new name: aName; yourself 
]

{ #category : #'api - accessing' }
ObjectInSpace >> amountOfAllOrbits [
	
	^ self amountOfOrbitsRecursivelyFrom: 0
]

{ #category : #'private ' }
ObjectInSpace >> amountOfOrbitsRecursivelyFrom: initialAmount [


	self orbits ifNil: [ ^ initialAmount  ].
	^ self orbits amountOfOrbitsRecursivelyFrom: initialAmount + 1
]

{ #category : #comparing }
ObjectInSpace >> hash [
	^ self name hash
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
ObjectInSpace >> orbits [
	^ orbits
]

{ #category : #accessing }
ObjectInSpace >> orbits: anObject [
	orbits := anObject
]

{ #category : #printing }
ObjectInSpace >> printOn: stream [
	super printOn: stream.
	stream nextPut: $(.
	stream nextPutAll: self name.
	stream nextPut: $)
]
