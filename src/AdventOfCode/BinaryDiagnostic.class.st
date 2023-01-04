"
AoC 2021 - day 3 part 1
"
Class {
	#name : #BinaryDiagnostic,
	#superclass : #AoC2021,
	#instVars : [
		'gamma'
	],
	#category : #'AdventOfCode-AoC2021'
}

{ #category : #private }
BinaryDiagnostic >> compute [ 
	|aNumbers bitStringSize |
	aNumbers := self diagnosticNumbers.
	bitStringSize := aNumbers max highBit.
	1 to: bitStringSize do: [:bitPos |
		self gamma: (self cummulatedGammaAt: bitPos from: aNumbers).
	].
	
	^ self gamma * (self getEpsilonOfsize: bitStringSize)
]

{ #category : #private }
BinaryDiagnostic >> countOfOnesIn: aNumbers bitAt: bitPos [
	
	^ aNumbers count: [:aNumber | (aNumber bitAt: bitPos) = 1]
	
]

{ #category : #private }
BinaryDiagnostic >> cummulatedGammaAt: bitPos from: aNumbers [
	
		^ self gamma bitOr: (0 bitAt: bitPos put: (self mostCommonBitAt: bitPos from: aNumbers))
]

{ #category : #private }
BinaryDiagnostic >> diagnosticNumbers [

	^ self input substrings collect: [:aStr | Number readFrom: aStr base: 2]
]

{ #category : #accessing }
BinaryDiagnostic >> epsilon [

	^ self gamma 
]

{ #category : #accessing }
BinaryDiagnostic >> gamma [

	^ gamma
]

{ #category : #accessing }
BinaryDiagnostic >> gamma: anObject [

	gamma := anObject
]

{ #category : #private }
BinaryDiagnostic >> getEpsilonOfsize: bitSize [
	
	^ (self getMaskForUnusedBits: bitSize) bitAnd: self gamma bitInvert
]

{ #category : #private }
BinaryDiagnostic >> getMaskForUnusedBits: maskLength [
	
	^ 2 ** maskLength - 1
]

{ #category : #initialization }
BinaryDiagnostic >> initialize [ 
	super initialize.
	self gamma: 0.
]

{ #category : #private }
BinaryDiagnostic >> mostCommonBitAt: bitPos from: aNumbers [
	|bitCount |
	"count ones in sequence of numbers at a bit position"
	bitCount := self countOfOnesIn: aNumbers  bitAt: bitPos.
	"when zero and one count is equal, use default bit value"
	((bitCount * 2) = aNumbers size) ifTrue: [ ^ 1 ].
	
	^ (bitCount > (aNumbers size / 2)) asBit
]
