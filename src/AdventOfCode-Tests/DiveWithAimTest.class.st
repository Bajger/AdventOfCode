"
A DiveWithAimTest is a test class for testing the behavior of DiveWithAim
"
Class {
	#name : #DiveWithAimTest,
	#superclass : #TestCase,
	#category : #'AdventOfCode-Tests-AoC2021'
}

{ #category : #tests }
DiveWithAimTest >> testCompute [
	
	|diveWithAim|
	diveWithAim := DiveWithAim new.
	diveWithAim input: 'forward 5
down 5
forward 8
up 3
down 8
forward 2
'.
	self assert: diveWithAim compute equals: 900.
]
