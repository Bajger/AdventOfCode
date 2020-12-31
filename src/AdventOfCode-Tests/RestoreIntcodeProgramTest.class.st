Class {
	#name : #RestoreIntcodeProgramTest,
	#superclass : #TestCase,
	#category : #'AdventOfCode-Tests-AoC2019'
}

{ #category : #tests }
RestoreIntcodeProgramTest >> test100099Input [
self assert: (RestoreIntcodeProgram new input: '1,0,0,0,99'; processOpcodesOfProgram) 
equals: { 2. 0. 0. 0. 99 }
]

{ #category : #tests }
RestoreIntcodeProgramTest >> test11149956099Input [
self assert: (RestoreIntcodeProgram new input: '1,1,1,4,99,5,6,0,99'; processOpcodesOfProgram) 
equals: {30. 1. 1. 4. 2. 5. 6. 0. 99}
]

{ #category : #tests }
RestoreIntcodeProgramTest >> test230399Input [
self assert: (RestoreIntcodeProgram new input: '2,3,0,3,99'; processOpcodesOfProgram) 
equals: { 2. 3. 0. 6. 99 }
]

{ #category : #tests }
RestoreIntcodeProgramTest >> test2445990Input [
self assert: (RestoreIntcodeProgram new input: '2,4,4,5,99,0'; processOpcodesOfProgram) 
equals: {2. 4. 4. 5. 99. 9801}
]

{ #category : #tests }
RestoreIntcodeProgramTest >> testPuzzleInputFor5866663Output [

	self assert: (RestoreIntcodeProgram new compute) equals: 5866663
]
