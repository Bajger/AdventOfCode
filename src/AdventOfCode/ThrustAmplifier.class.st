"
AoC2021 - day 7: Amplifier for Amplification circuit
"
Class {
	#name : 'ThrustAmplifier',
	#superclass : 'Object',
	#instVars : [
		'programComputer',
		'id'
	],
	#category : 'AdventOfCode-AoC2019',
	#package : 'AdventOfCode',
	#tag : 'AoC2019'
}

{ #category : 'instance creation' }
ThrustAmplifier class >> withId: anAmpId [
	^ self new
		id: anAmpId;
		yourself
]

{ #category : 'accessing' }
ThrustAmplifier >> id [
	^ id
]

{ #category : 'accessing' }
ThrustAmplifier >> id: anObject [
	id := anObject
]

{ #category : 'accessing' }
ThrustAmplifier >> inputSignal [
	^ self programComputer rawProgramInput
]

{ #category : 'testing' }
ThrustAmplifier >> isLast [

	^ self id = $E
]

{ #category : 'accessing' }
ThrustAmplifier >> outputSignal [

	^ self programComputer programOutput 
]

{ #category : 'accessing' }
ThrustAmplifier >> phaseSetting [
	^ self programComputer phaseSetting
]

{ #category : 'accessing' }
ThrustAmplifier >> programComputer [
	^ programComputer ifNil: [programComputer := AmpComputer new ]
]

{ #category : 'actions api' }
ThrustAmplifier >> resetAmpWith: codeProgramString [
	"set up-to-date input from circuit input to all amp's computers"
	self programComputer input: codeProgramString.
	self programComputer setIntcodeProgram.
	self programComputer resetInOut.
]

{ #category : 'actions api' }
ThrustAmplifier >> runAmpProgram [

	self programComputer compute
]

{ #category : 'accessing' }
ThrustAmplifier >> setInputSignal: aSignal [

	self programComputer programInput: aSignal
	
]

{ #category : 'actions api' }
ThrustAmplifier >> setInputSignalForNextAmp: nextAmp [

	nextAmp setInputSignal: self outputSignal
]

{ #category : 'accessing' }
ThrustAmplifier >> setPhaseSetting: aSetting [
	
	self programComputer phaseSetting: aSetting
]

{ #category : 'private ' }
ThrustAmplifier >> setProgramComputer: aCodeProgramString [

	self programComputer input: aCodeProgramString 
]

{ #category : 'accessing' }
ThrustAmplifier >> setProgramOutput: aValue [
	
	self programComputer programOutput: aValue
]
