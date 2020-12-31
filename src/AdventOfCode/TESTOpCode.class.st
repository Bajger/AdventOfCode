Class {
	#name : #TESTOpCode,
	#superclass : #OpCode,
	#category : #'AdventOfCode-AoC2019'
}

{ #category : #private }
TESTOpCode >> isImmediateModeAt: paramNumber [

	^ (super opcode decimalDigitAt: paramNumber + 2) = 1
]

{ #category : #private }
TESTOpCode >> opcode [

	|fiveDigitsCode|
	fiveDigitsCode := super opcode. 
	^ (0 to: 1) sumNumbers: [ :index | 
		(10 raisedTo: index) * fiveDigitsCode decimalDigitAt: (index + 1)		
	]
]

{ #category : #private }
TESTOpCode >> parameterAt: index [

	(self isImmediateModeAt: index) ifTrue: [^ self indexOfNr: index].
	^ super parameterAt: index
]
