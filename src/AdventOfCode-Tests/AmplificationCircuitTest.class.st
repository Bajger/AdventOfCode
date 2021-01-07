Class {
	#name : #AmplificationCircuitTest,
	#superclass : #TestCase,
	#category : #'AdventOfCode-Tests-AoC2019'
}

{ #category : #tests }
AmplificationCircuitTest >> test43210MaxThrust [

	|aProgram result1 result2 result3 result4 result5| 
	aProgram := TESTDiagnostic new 
		input: '3,15,3,16,1002,16,10,16,1,16,15,15,4,15,99,0,0';
		programInput: 4
		yourself. 
	"1st amp"
	aProgram compute.
	self traceCr: aProgram programOutput printString.
	result1 := aProgram programOutput.

	 " 2nd ampiflier"
	aProgram setIntcodeProgram.
	aProgram programInput: 3 | result1 .
	aProgram programOutput: 0.
	aProgram compute.
	self traceCr: aProgram programOutput printString.
	result2 := aProgram programOutput.
	
	 " 3nd ampiflier"
	aProgram setIntcodeProgram.
	aProgram programInput: 2 | result2.
	aProgram programOutput: 0.
	aProgram compute.
	self traceCr: aProgram programOutput printString.
	result3 := aProgram programOutput.
	
	 " 4th ampiflier"
	aProgram setIntcodeProgram.
	aProgram programInput: 1 | result3.
	aProgram programOutput: 0.
	aProgram compute.
	self traceCr: aProgram programOutput printString.
	result4 := aProgram programOutput.
	
 " 5th ampiflier"
	aProgram setIntcodeProgram.
	aProgram programInput: 0 | result4.
	aProgram programOutput: 0.
	aProgram compute.
	self traceCr: aProgram programOutput printString.
	result5 := aProgram programOutput.
]
