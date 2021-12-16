"
AoC2019 - Day 7 part 1
"
Class {
	#name : #AmplificationCircuit,
	#superclass : #AoC2019,
	#instVars : [
		'amplifiers',
		'maxThrusterSignal'
	],
	#category : #'AdventOfCode-day7'
}

{ #category : #'private-constants' }
AmplificationCircuit class >> getInputString [

	^ '3,8,1001,8,10,8,105,1,0,0,21,42,55,64,85,98,179,260,341,422,99999,3,9,101,2,9,9,102,5,9,9,1001,9,2,9,1002,9,5,9,4,9,99,3,9,1001,9,5,9,1002,9,4,9,4,9,99,3,9,101,3,9,9,4,9,99,3,9,1002,9,4,9,101,3,9,9,102,5,9,9,101,4,9,9,4,9,99,3,9,1002,9,3,9,1001,9,3,9,4,9,99,3,9,1002,9,2,9,4,9,3,9,101,1,9,9,4,9,3,9,101,1,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,1,9,9,4,9,3,9,101,1,9,9,4,9,3,9,101,2,9,9,4,9,3,9,1001,9,1,9,4,9,3,9,1002,9,2,9,4,9,3,9,1001,9,2,9,4,9,99,3,9,1002,9,2,9,4,9,3,9,101,2,9,9,4,9,3,9,1001,9,2,9,4,9,3,9,101,2,9,9,4,9,3,9,102,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,1,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,102,2,9,9,4,9,3,9,101,2,9,9,4,9,99,3,9,1002,9,2,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,1,9,9,4,9,3,9,1001,9,2,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,1,9,9,4,9,3,9,101,2,9,9,4,9,3,9,101,2,9,9,4,9,3,9,102,2,9,9,4,9,3,9,102,2,9,9,4,9,99,3,9,102,2,9,9,4,9,3,9,102,2,9,9,4,9,3,9,1001,9,2,9,4,9,3,9,1001,9,1,9,4,9,3,9,1001,9,1,9,4,9,3,9,101,1,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,1002,9,2,9,4,9,99,3,9,1001,9,1,9,4,9,3,9,102,2,9,9,4,9,3,9,1001,9,1,9,4,9,3,9,1002,9,2,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,2,9,9,4,9,3,9,1001,9,1,9,4,9,3,9,1002,9,2,9,4,9,3,9,102,2,9,9,4,9,3,9,102,2,9,9,4,9,99
'
]

{ #category : #accessing }
AmplificationCircuit >> amplifiers [
	^ amplifiers
]

{ #category : #accessing }
AmplificationCircuit >> amplifiers: anObject [
	amplifiers := anObject
]

{ #category : #'actions api' }
AmplificationCircuit >> compute [

	(0 to: 4) permutationsDo: [:aSettingArray |
		self runCircuitForPhaseSettings: aSettingArray.
		self setMaxThrusterSignal: self lastAmpOutput.
		self resetAmps.
	 ].
	^ self maxThrusterSignal 
]

{ #category : #initialize }
AmplificationCircuit >> initialize [ 
	
	super initialize.
	self amplifiers: OrderedCollection new.
	self maxThrusterSignal: 0.
	self initializeAmplifiers.
]

{ #category : #initialize }
AmplificationCircuit >> initializeAmplifiers [

	self initializeAmpsWithProgram: self input
]

{ #category : #private }
AmplificationCircuit >> initializeAmpsWithProgram: codeProgramString [

	($A to: $E) do: [:ampId |
		|amp| 
		amp := ThrustAmplifier withId: ampId.
		amp setProgramComputer: codeProgramString.
		self amplifiers add: amp
	].
	self amplifiers first setInputSignal: 0.
]

{ #category : #private }
AmplificationCircuit >> lastAmpOutput [
	^ self amplifiers last outputSignal
]

{ #category : #accessing }
AmplificationCircuit >> maxThrusterSignal [
	^ maxThrusterSignal 
]

{ #category : #accessing }
AmplificationCircuit >> maxThrusterSignal: aValue [

	maxThrusterSignal := aValue
]

{ #category : #private }
AmplificationCircuit >> resetAmps [

	self amplifiers do: [:amp | amp resetAmpWith: self input].
]

{ #category : #'actions api' }
AmplificationCircuit >> runCircuitForPhaseSettings: aSettingArray [

	aSettingArray withIndexDo: [:aSetting :idx |
		|amp|
		amp := self amplifiers at: idx.
		amp setPhaseSetting: aSetting.
		amp runAmpProgram.
		amp isLast ifFalse: [amp setInputSignalForNextAmp: (self amplifiers at: idx + 1)]
	]
	
]

{ #category : #'actions api' }
AmplificationCircuit >> setMaxThrusterSignal: aValue [

	self maxThrusterSignal < aValue ifTrue: [ maxThrusterSignal := aValue ].	
	
]

{ #category : #private }
AmplificationCircuit >> variationsOf: nrOfMembers usingRange: anInterval do: aBlock [
	
	|variations|
	variations := OrderedCollection new.
	^ self variationsOf: nrOfMembers  usingRange: anInterval on: variations  do: aBlock 
]

{ #category : #private }
AmplificationCircuit >> variationsOf: nrOfMembers usingRange: anInterval on: aColl do: aBlock [

	aColl size = nrOfMembers ifTrue: [ aBlock value: aColl. aColl removeLast. ^ aColl ].
	anInterval do: [:aNumber |
		aColl add: aNumber.
		self variationsOf: nrOfMembers usingRange: anInterval on: aColl do: aBlock.
	].
	aColl ifNotEmpty: [aColl removeLast].
]
