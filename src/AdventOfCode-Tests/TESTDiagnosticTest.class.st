"
A TESTDiagnosticTest is a test class for testing the behavior of TESTDiagnostic
"
Class {
	#name : #TESTDiagnosticTest,
	#superclass : #TestCase,
	#category : #'AdventOfCode-Tests-AoC2019'
}

{ #category : #tests }
TESTDiagnosticTest >> test100243433Instruction [
	|aProgram|
	aProgram := TESTDiagnostic new 
		input: '1002,4,3,4,33'; 
		programInput: 1; 
		yourself. 
	self assert: (aProgram compute; intcodeProgram) equals: {1002. 4. 3. 4. 99}.
]

{ #category : #tests }
TESTDiagnosticTest >> testInputToOutputInstruction [
	|aProgram|
	aProgram := TESTDiagnostic new 
		input: '3,0,4,0,99'; 
		programInput: 666; 
		yourself. 
	self assert: aProgram compute equals: 666.
]

{ #category : #tests }
TESTDiagnosticTest >> testPuzzleInputInstruction [

	self assert: (TESTDiagnostic new compute) equals: 15259545.
]
