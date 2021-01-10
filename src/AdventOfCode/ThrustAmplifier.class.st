Class {
	#name : #ThrustAmplifier,
	#superclass : #Object,
	#instVars : [
		'codeProgram',
		'id'
	],
	#category : #'AdventOfCode-day7'
}

{ #category : #'instance creation' }
ThrustAmplifier class >> withId: anAmpId [
	^ self new
		id: anAmpId;
		yourself
]

{ #category : #accessing }
ThrustAmplifier >> codeProgram [
	^ codeProgram
]

{ #category : #accessing }
ThrustAmplifier >> codeProgram: anObject [
	codeProgram := anObject
]

{ #category : #accessing }
ThrustAmplifier >> id [
	^ id
]

{ #category : #accessing }
ThrustAmplifier >> id: anObject [
	id := anObject
]

{ #category : #accessing }
ThrustAmplifier >> inputSignal [
	^ self codeProgram rawProgramInput
]

{ #category : #testing }
ThrustAmplifier >> isLast [

	^ self id = $E
]

{ #category : #accessing }
ThrustAmplifier >> outputSignal [

	^ self codeProgram programOutput 
]

{ #category : #accessing }
ThrustAmplifier >> phaseSetting [
	^ self codeProgram phaseSetting
]

{ #category : #'actions api' }
ThrustAmplifier >> runAmpProgram [

	self codeProgram compute
]

{ #category : #'actions api' }
ThrustAmplifier >> setInputSignal: aSignal [

	self codeProgram programInput: aSignal
	
]

{ #category : #'actions api' }
ThrustAmplifier >> setInputSignalForNextAmp: nextAmp [

	nextAmp setInputSignal: self outputSignal
]

{ #category : #'actions api' }
ThrustAmplifier >> setPhaseSetting: aSetting [
	
	self codeProgram phaseSetting: aSetting
]

{ #category : #'actions api' }
ThrustAmplifier >> setProgram: aCodeProgram [

	self codeProgram intcodeProgram: aCodeProgram
]
