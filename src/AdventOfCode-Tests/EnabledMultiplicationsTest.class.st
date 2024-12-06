"
An EnabledMultiplicationsTest is a test class for testing the behavior of EnabledMultiplications
"
Class {
	#name : 'EnabledMultiplicationsTest',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-Tests-AoC2024',
	#package : 'AdventOfCode-Tests',
	#tag : 'AoC2024'
}

{ #category : 'tests' }
EnabledMultiplicationsTest >> testCompute [

	|solution|
	solution := EnabledMultiplications new.
	self assert: solution compute equals: 70478672.
]

{ #category : 'tests' }
EnabledMultiplicationsTest >> testComputeSample [ 
	|solution|
	solution := EnabledMultiplications new.
	solution input: 'xmul(2,4)&mul[3,7]!^don''t()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))'.
	self assert: solution compute equals: 48.
]
