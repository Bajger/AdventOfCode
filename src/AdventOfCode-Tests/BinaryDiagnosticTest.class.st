"
A BinaryDiagnosticTest is a test class for testing the behavior of BinaryDiagnostic
"
Class {
	#name : #BinaryDiagnosticTest,
	#superclass : #TestCase,
	#category : #'AdventOfCode-Tests-AoC2021'
}

{ #category : #test }
BinaryDiagnosticTest >> testCompute [
	|binaryDiagnostic|
	binaryDiagnostic := BinaryDiagnostic new.
	binaryDiagnostic input: '00100
11110
10110
10111
10101
01111
00111
11100
10000
11001
00010
01010'.
	self assert: binaryDiagnostic compute equals: 198.
]

{ #category : #test }
BinaryDiagnosticTest >> testCummulatedGammaAtFrom [

	|binaryDiagnostic|
	binaryDiagnostic := BinaryDiagnostic new.
	binaryDiagnostic input: '00100
	00010
	00010
	00010'.
	1 to: 5 do: [:idx |
		binaryDiagnostic gamma: (binaryDiagnostic cummulatedGammaAt: idx from: binaryDiagnostic diagnosticNumbers)  
		].
	self assert: binaryDiagnostic gamma equals: (Number readFrom: '00010' base: 2)
]

{ #category : #tests }
BinaryDiagnosticTest >> testDiagnosticNumbers [	
	|binaryDiagnostic|
	binaryDiagnostic := BinaryDiagnostic new.
	binaryDiagnostic input: '00100
	00010'.
	self assert: binaryDiagnostic diagnosticNumbers asArray equals: #(4 2).
]

{ #category : #test }
BinaryDiagnosticTest >> testGetEpsilonSize [
	|binaryDiagnostic|
	binaryDiagnostic := BinaryDiagnostic new gamma: 30; yourself.
	self assert: (binaryDiagnostic getEpsilonOfsize: 5) equals: 1.
	
	binaryDiagnostic gamma: 2730.
	self assert: (binaryDiagnostic getEpsilonOfsize: 12) equals: 1365.
]

{ #category : #test }
BinaryDiagnosticTest >> testGetMaskForUnusedBits [

	self assert: (BinaryDiagnostic new getMaskForUnusedBits: 5) equals: 31
]

{ #category : #tests }
BinaryDiagnosticTest >> testMostCommonBitAtFrom [	
	|binaryDiagnostic|
	binaryDiagnostic := BinaryDiagnostic new.
	binaryDiagnostic input: '00100
	00010
	00010
	00010'.
	self assert: (binaryDiagnostic mostCommonBitAt: 1 from: binaryDiagnostic diagnosticNumbers) equals: 0.
	self assert: (binaryDiagnostic mostCommonBitAt: 2 from: binaryDiagnostic diagnosticNumbers) equals: 1.
]
