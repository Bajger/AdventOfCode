"
A MultipleCratesAtOnceTest is a test class for testing the behavior of MultipleCratesAtOnce
"
Class {
	#name : 'MultipleCratesAtOnceTest',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-Tests-AoC2022',
	#package : 'AdventOfCode-Tests',
	#tag : 'AoC2022'
}

{ #category : 'tests' }
MultipleCratesAtOnceTest >> testComputeSample [

	|stacks|
	stacks := MultipleCratesAtOnce new.
	self assert: stacks compute equals: 'QLFQDBBHM'.
]
