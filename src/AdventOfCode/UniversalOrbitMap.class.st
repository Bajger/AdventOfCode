"
2019 - day 6 part 1
"
Class {
	#name : #UniversalOrbitMap,
	#superclass : #AoC2019,
	#instVars : [
		'objectsInSpace'
	],
	#category : #'AdventOfCode-AoC2019'
}

{ #category : #'api actions' }
UniversalOrbitMap >> compute [ 
	self processOrbitMap.
	^ self objectsInSpace sumNumbers: #amountOfAllOrbits
]

{ #category : #'api - accessing' }
UniversalOrbitMap >> getOrCreateObjectNamed: aName [

 ^ self objectsInSpace detect: [:obj | obj name = aName ] ifNone:  [self objectsInSpace add: (ObjectInSpace named: aName)]
]

{ #category : #initialize }
UniversalOrbitMap >> initialize [ 

	super initialize.
	self objectsInSpace: Set new.
	
]

{ #category : #accessing }
UniversalOrbitMap >> objectsInSpace [
	^ objectsInSpace
]

{ #category : #accessing }
UniversalOrbitMap >> objectsInSpace: anObject [
	objectsInSpace := anObject
]

{ #category : #'api - accessing' }
UniversalOrbitMap >> processOrbitMap [

	self input substrings do: [:aRow | 
		|tupleOfObjects leftObject rightObject|
		tupleOfObjects := aRow splitOn: $).
		leftObject := self getOrCreateObjectNamed: (tupleOfObjects first).
		rightObject := self getOrCreateObjectNamed: (tupleOfObjects second).
		rightObject orbits: leftObject 
	]
]
