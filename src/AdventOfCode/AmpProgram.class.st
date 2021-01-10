Class {
	#name : #AmpProgram,
	#superclass : #TESTDiagnostic,
	#instVars : [
		'amplifier',
		'phaseConsumed',
		'phaseSetting'
	],
	#category : #'AdventOfCode-day7'
}

{ #category : #'instance creation' }
AmpProgram class >> newWith: anAmp [
	^ self basicNew
		initializeWith: anAmp;
		yourself
]

{ #category : #accessing }
AmpProgram >> amplifier [
	^ amplifier
]

{ #category : #accessing }
AmpProgram >> amplifier: anObject [
	amplifier := anObject
]

{ #category : #initialize }
AmpProgram >> initializeWith: anAmplifier [
	self initialize.
	self amplifier: anAmplifier.
	self phaseConsumed: false.
]

{ #category : #accessing }
AmpProgram >> phaseConsumed [
	^ phaseConsumed
]

{ #category : #accessing }
AmpProgram >> phaseConsumed: anObject [
	phaseConsumed := anObject
]

{ #category : #accessing }
AmpProgram >> phaseSetting [
	^ phaseSetting
]

{ #category : #accessing }
AmpProgram >> phaseSetting: anObject [
	phaseSetting := anObject
]

{ #category : #accessing }
AmpProgram >> programInput [ 

	self phaseConsumed ifTrue: [ ^ self rawProgramInput ].
	self phaseConsumed: true.
	^ self phaseSetting
	
]

{ #category : #accessing }
AmpProgram >> rawProgramInput [ 

 ^ super programInput
]
