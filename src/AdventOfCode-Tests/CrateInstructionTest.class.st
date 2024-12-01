"
A CrateInstructionTest is a test class for testing the behavior of CrateInstruction
"
Class {
	#name : 'CrateInstructionTest',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-Tests-AoC2022',
	#package : 'AdventOfCode-Tests',
	#tag : 'AoC2022'
}

{ #category : 'tests' }
CrateInstructionTest >> testFrom [
	|cmd| 
	cmd := CrateInstruction from: 'move 2 from 7 to 5'.
	self assert: cmd amount equals: 2.
	self assert: cmd from equals: 7.
	self assert: cmd to equals: 5.
	
	cmd := CrateInstruction from: 'move 99 from 700 to 515'.
	self assert: cmd amount equals: 99.
	self assert: cmd from equals: 700.
	self assert: cmd to equals: 515.
]
