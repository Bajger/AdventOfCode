Class {
	#name : #TESTDiagnosticThermalRadiatorsTest,
	#superclass : #TESTDiagnosticTest,
	#category : #'AdventOfCode-Tests-AoC2019'
}

{ #category : #tests }
TESTDiagnosticThermalRadiatorsTest >> testThermalRadiatorsImmediateModeInput8Output1 [
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
TESTDiagnosticThermalRadiatorsTest >> testThermalRadiatorsPositionModeInput8Output1 [
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
TESTDiagnosticThermalRadiatorsTest >> testThermalRadiatorsPositionModeInputLessThan8Output1 [
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
