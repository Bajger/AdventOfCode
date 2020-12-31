"
A FindNounAndVerbTest is a test class for testing the behavior of FindNounAndVerb
"
Class {
	#name : #FindNounAndVerbTest,
	#superclass : #TestCase,
	#category : #'AdventOfCode-Tests-AoC2019'
}

{ #category : #tests }
FindNounAndVerbTest >> test19690720output [

	self assert: FindNounAndVerb new compute equals: 4259.
]
