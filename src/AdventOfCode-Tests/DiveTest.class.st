"
A DiveTest is a test class for testing the behavior of Dive
"
Class {
	#name : #DiveTest,
	#superclass : #TestCase,
	#category : #'AdventOfCode-Tests-AoC2021'
}

{ #category : #tests }
DiveTest >> testCompute [
	
	|aSonarSweep|
	aSonarSweep := Dive new.
	aSonarSweep input: 'forward 5
down 5
forward 8
up 3
down 8
forward 2
'.
	self assert: aSonarSweep compute equals: 150.
]

{ #category : #tests }
DiveTest >> testSubmarineCommands [
	
	|aSonarSweep|
	aSonarSweep := Dive new.
	aSonarSweep input: 'forward 5
down 5
forward 8
up 3
down 8
forward 2
'.
	self assert: aSonarSweep getSubmarineCommands size equals: 6.
	self assert: (aSonarSweep getSubmarineCommands allSatisfy: [ :assoc |
		assoc key isString and: [ assoc value isNumber ]
		 ])
		
]
