Class {
	#name : #TESTDiagnosticThermalRadiatorsTest,
	#superclass : #TESTDiagnosticTest,
	#category : #'AdventOfCode-Tests-AoC2019'
}

{ #category : #tests }
TESTDiagnosticThermalRadiatorsTest >> testImmediateModeInput8Output1 [
	|aProgram|
	aProgram := TESTDiagnosticThermalRadiators new 
		input: '3,3,1108,-1,8,3,4,3,99'; 
		programInput: 8; 
		yourself. 
	self assert: aProgram compute equals: 1.
	
	aProgram programInput: 1; programOutput: 0; setIntcodeProgram.
	self assert: aProgram compute equals: 0.
]

{ #category : #tests }
TESTDiagnosticThermalRadiatorsTest >> testImmediateModeInputLessThan8Output1 [
	|aProgram|
	aProgram := TESTDiagnosticThermalRadiators new 
		input: '3,3,1107,-1,8,3,4,3,99';
		programInput: 8 
		yourself. 
	self assert: aProgram compute equals: 0.
	
	0 to: 7 do: [:inputValue |
		aProgram programInput: inputValue; programOutput: 0; setIntcodeProgram.
		self assert: aProgram compute equals: 1.		
	]
]

{ #category : #tests }
TESTDiagnosticThermalRadiatorsTest >> testJumpIfImmediateMode [
	|aProgram|
	aProgram := TESTDiagnosticThermalRadiators new 
		input: '3,3,1105,-1,9,1101,0,0,12,4,12,99,1';
		programInput: 5
		yourself. 
	self assert: aProgram compute equals: 1.
	

	aProgram programInput: 0; programOutput: 0; setIntcodeProgram.
	self assert: aProgram compute equals: 0.		

]

{ #category : #tests }
TESTDiagnosticThermalRadiatorsTest >> testJumpIfPositionMode [
	|aProgram|
	aProgram := TESTDiagnosticThermalRadiators new 
		input: '3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9';
		programInput: 5
		yourself. 
	self assert: aProgram compute equals: 1.
	

	aProgram programInput: 0; programOutput: 0; setIntcodeProgram.
	self assert: aProgram compute equals: 0.		

]

{ #category : #tests }
TESTDiagnosticThermalRadiatorsTest >> testLargeExample [
	|aProgram|
	aProgram := TESTDiagnosticThermalRadiators new 
		input: '3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99';
		programInput: 8 
		yourself. 
	self assert: aProgram compute equals: 1000.
	
	0 to: 7 do: [:inputValue |
		aProgram programInput: inputValue; programOutput: 0; setIntcodeProgram.
		self assert: aProgram compute equals: 999.		
	].

	aProgram programInput: 99; programOutput: 0; setIntcodeProgram.
	self assert: aProgram compute equals: 1001.
]

{ #category : #tests }
TESTDiagnosticThermalRadiatorsTest >> testPositionModeInput8Output1 [
	|aProgram|
	aProgram := TESTDiagnosticThermalRadiators new 
		input: '3,9,8,9,10,9,4,9,99,-1,8'; 
		programInput: 8; 
		yourself. 
	self assert: aProgram compute equals: 1.
	
	aProgram programInput: 1; programOutput: 0; setIntcodeProgram.
	self assert: aProgram compute equals: 0.
]

{ #category : #tests }
TESTDiagnosticThermalRadiatorsTest >> testPositionModeInputLessThan8Output1 [
	|aProgram|
	aProgram := TESTDiagnosticThermalRadiators new 
		input: '3,9,7,9,10,9,4,9,99,-1,8';
		programInput: 8 
		yourself. 
	self assert: aProgram compute equals: 0.
	
	0 to: 7 do: [:inputValue |
		aProgram programInput: inputValue; programOutput: 0; setIntcodeProgram.
		self assert: aProgram compute equals: 1.		
	]
]

{ #category : #tests }
TESTDiagnosticThermalRadiatorsTest >> testPuzzleInputInstruction [

	self assert: (TESTDiagnosticThermalRadiators new compute) equals: 7616021.
]
