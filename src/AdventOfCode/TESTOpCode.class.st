Class {
	#name : #TESTOpCode,
	#superclass : #OpCode,
	#category : #'AdventOfCode-AoC2019'
}

{ #category : #'api - accessing' }
TESTOpCode >> alreadyModifiedPointer [
	^ (self opcode = 5 and: [ self firstParameter isZero not ])
		or: [ self opcode = 6 and: [ self firstParameter isZero ] ]
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
		ifTrue: [ self setIntructionPointer: self secondParameter ]
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
	self opcode = 4 ifTrue: [ 	self codeComputer programOutput: self firstParameter].
		
	"part B"
	self opcode = 5 ifTrue: [ 	self jumpIf: self firstParameter isZero not].
	self opcode = 6 ifTrue: [ 	self jumpIf: self firstParameter isZero].
	self opcode = 7 ifTrue: [ 	self storeResult: (self firstParameter < self secondParameter) asBit].	
	self opcode = 8 ifTrue: [ 	self storeResult: (self firstParameter = self secondParameter) asBit].
]

{ #category : #private }
TESTOpCode >> setIntructionPointer: instructionAddress [
	
	self codeComputer sequenceIndex: instructionAddress + 1
]

{ #category : #'api - accessing' }
TESTOpCode >> stepForNextCode [
		
	((1 to: 2) includes: self opcode) ifTrue: [ ^ super stepForNextCode].
	^ 2
]

{ #category : #private }
TESTOpCode >> storeResult: aResult [
	
	"if opcode is 03, use 1st parameter, otherwise 3rd parameter in case of other opcodes"
	self opcode = 3 ifTrue: [^ self storeResultAt: 1 put: aResult].
	super storeResult: aResult
]
