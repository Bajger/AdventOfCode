Class {
	#name : #TESTOpCode,
	#superclass : #OpCode,
	#instVars : [
		'stepForNextOpcode'
	],
	#category : #'AdventOfCode-day5'
}

{ #category : #private }
TESTOpCode >> implicitStepForNextCode [

	(#(1 2 7 8) includes: self opcode) ifTrue: [ ^ super stepForNextCode].
	(#(5 6) includes: self opcode) ifTrue: [ ^ 3].
	^ 2
]

{ #category : #initialize }
TESTOpCode >> initialize [
	super initialize.
	self stepForNextCode: 0.
]

{ #category : #private }
TESTOpCode >> isImmediateModeAt: paramNumber [
"
based on scheme, C,B,A parameters are +2,+3,+4 
ABCDE
 1002

DE - two-digit opcode,      02 == opcode 2
 C - mode of 1st parameter,  0 == position mode
 B - mode of 2nd parameter,  1 == immediate mode
 A - mode of 3rd parameter,  0 == position mode,
"
	^ (super opcode decimalDigitAt: paramNumber + 2) = 1
]

{ #category : #private }
TESTOpCode >> jumpIf: aBool [
	aBool
		ifFalse: [ ^ self ].
	self setStepForNextCode
]

{ #category : #private }
TESTOpCode >> opcode [

	|fiveDigitsCode|
	fiveDigitsCode := super opcode. 
	^ (0 to: 1) sumNumbers: [ :index | 
		(10 raisedTo: index) * (fiveDigitsCode decimalDigitAt: (index + 1))		
	]
]

{ #category : #private }
TESTOpCode >> parameterAt: index [

	(self isImmediateModeAt: index) ifTrue: [^ self rawValueOf: index].
	^ super parameterAt: index
]

{ #category : #private }
TESTOpCode >> performOperation [ 

	super performOperation.
	self opcode = 3 ifTrue: [ 	self storeResult: self codeComputer programInput].
	self opcode = 4 ifTrue: [ 	self codeComputer setProgramOutput: self firstParameter].
		
	"part B"
	self opcode = 5 ifTrue: [ 	self jumpIf: self firstParameter isZero not].
	self opcode = 6 ifTrue: [ 	self jumpIf: self firstParameter isZero].
	self opcode = 7 ifTrue: [ 	self storeResult: (self firstParameter < self secondParameter) asBit].	
	self opcode = 8 ifTrue: [ 	self storeResult: (self firstParameter = self secondParameter) asBit].
]

{ #category : #'api - accessing' }
TESTOpCode >> setStepForNextCode [

	self stepForNextCode: (self secondParameter + 1 - (self codeComputer sequenceIndex))
]

{ #category : #private }
TESTOpCode >> shouldHalt [ 

	^ super shouldHalt or: [ self opcode = 4 and: [self codeComputer programOutput isZero not ]]
]

{ #category : #'api - accessing' }
TESTOpCode >> stepForNextCode [

	stepForNextOpcode isZero ifTrue: [ ^ self implicitStepForNextCode  ].
	^ stepForNextOpcode 
]

{ #category : #private }
TESTOpCode >> stepForNextCode: aStep [

	stepForNextOpcode := aStep
]

{ #category : #private }
TESTOpCode >> storeResult: aResult [
	
	"if opcode is 03, use 1st parameter, otherwise 3rd parameter in case of other opcodes"
	self opcode = 3 ifTrue: [^ self storeResultAt: 1 put: aResult].
	super storeResult: aResult
]
