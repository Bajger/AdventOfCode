"
2019 - day 5 part 1
"
Class {
	#name : #TESTDiagnostic,
	#superclass : #RestoreIntcodeProgram,
	#instVars : [
		'programInput',
		'programOutput'
	],
	#category : #'AdventOfCode-AoC2019'
}

{ #category : #'api actions' }
TESTDiagnostic >> compute [ 
	self processOpcodesOfProgram.
	^ self programOutput 
]

{ #category : #private }
TESTDiagnostic >> generateOpcode [

	^ TESTOpCode on: self
]

{ #category : #initialization }
TESTDiagnostic >> initialize [ 
	super initialize.
	self programInput: 1.
	self programOutput: 0.
	
	
]

{ #category : #accessing }
TESTDiagnostic >> programInput [
	^ programInput
]

{ #category : #accessing }
TESTDiagnostic >> programInput: anObject [
	programInput := anObject
]

{ #category : #accessing }
TESTDiagnostic >> programOutput [
	^ programOutput
]

{ #category : #accessing }
TESTDiagnostic >> programOutput: anObject [
	programOutput := anObject.

]

{ #category : #accessing }
TESTDiagnostic >> setProgramOutput: aValue [
	(aValue isZero or: [ self programOutput isZero ])
		ifFalse: [ self
				error:
					'TEST diagnostic program failed: program output already set previously by value: '
						, self programOutput asString , ',  new output value: ', aValue asString ].
	self programOutput: aValue
]
