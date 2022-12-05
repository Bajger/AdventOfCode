"
AoC 2022 - Day 5 - instruction to move stacks
"
Class {
	#name : #CrateInstruction,
	#superclass : #AoC2022,
	#instVars : [
		'amount',
		'from',
		'to'
	],
	#category : #'AdventOfCode-AoC2022'
}

{ #category : #'instance creation' }
CrateInstruction class >> from: instructionLineString [

	|pairArray |
	pairArray := instructionLineString  findTokens: Character separators.
 	^ self new 
		initializeWith: pairArray;
		yourself 
	
]

{ #category : #accessing }
CrateInstruction >> amount [

	^ amount
]

{ #category : #accessing }
CrateInstruction >> amount: anObject [

	amount := anObject
]

{ #category : #accessing }
CrateInstruction >> from [

	^ from
]

{ #category : #accessing }
CrateInstruction >> from: anObject [

	from := anObject
]

{ #category : #initialization }
CrateInstruction >> initializeWith: pairArray [

	pairArray pairsDo: [:cmd :numberStr |
		cmd = 'move' ifTrue: [ self amount: numberStr asNumber].
		cmd = 'from' ifTrue: [ self from: numberStr asNumber].
		cmd = 'to' ifTrue: [ self to: numberStr asNumber].
	 ]
]

{ #category : #'api actions' }
CrateInstruction >> rearrangeOn: stackArray [

	self amount timesRepeat: [ 
		|fromStack toStack |
		fromStack := stackArray at: self from.
		toStack := stackArray at: self to.
		toStack push: fromStack pop.
	]
]

{ #category : #accessing }
CrateInstruction >> to [

	^ to
]

{ #category : #accessing }
CrateInstruction >> to: anObject [

	to := anObject
]
