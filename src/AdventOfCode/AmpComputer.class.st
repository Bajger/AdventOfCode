"
AoC2021 - day 7: Modification of original intcode computer
 - uses phase setting as input #1 
 - uses program input as input #2
"
Class {
	#name : 'AmpComputer',
	#superclass : 'TESTDiagnostic',
	#instVars : [
		'phaseConsumed',
		'phaseSetting'
	],
	#category : 'AdventOfCode-AoC2019',
	#package : 'AdventOfCode',
	#tag : 'AoC2019'
}

{ #category : 'instance creation' }
AmpComputer class >> newWith: inputStringProgram [
	^ self basicNew
		initializeWith: inputStringProgram;
		yourself
]

{ #category : 'executing' }
AmpComputer class >> solutionDayFileName [

	^ 'day-07.txt'
]

{ #category : 'initialize' }
AmpComputer >> initialize [
	super initialize.
	self phaseConsumed: false.
]

{ #category : 'accessing' }
AmpComputer >> phaseConsumed [
	^ phaseConsumed
]

{ #category : 'accessing' }
AmpComputer >> phaseConsumed: anObject [
	phaseConsumed := anObject
]

{ #category : 'accessing' }
AmpComputer >> phaseSetting [
	^ phaseSetting
]

{ #category : 'accessing' }
AmpComputer >> phaseSetting: anObject [
	phaseSetting := anObject
]

{ #category : 'accessing' }
AmpComputer >> programInput [ 

	self phaseConsumed ifTrue: [ ^ self rawProgramInput ].
	self phaseConsumed: true.
	^ self phaseSetting
	
]

{ #category : 'accessing' }
AmpComputer >> rawProgramInput [ 

 ^ super programInput
]

{ #category : 'private ' }
AmpComputer >> resetInOut [
	
	self phaseConsumed: false.
	self programInput: 0.
	self programOutput: 0.
	
]
