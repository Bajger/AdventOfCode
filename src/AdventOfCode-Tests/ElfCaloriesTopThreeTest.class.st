"
An ElfCaloriesTopThreeTest is a test class for testing the behavior of ElfCaloriesTopThree
"
Class {
	#name : #ElfCaloriesTopThreeTest,
	#superclass : #ElfCaloriesTest,
	#category : #'AdventOfCode-Tests-AoC2022'
}

{ #category : #tests }
ElfCaloriesTopThreeTest >> testCompute [

	|elfCalories|
	elfCalories := ElfCaloriesTopThree new.
	self assert: elfCalories compute equals: 215594.
]

{ #category : #tests }
ElfCaloriesTopThreeTest >> testComputeSample [

	|elfCalories|
	elfCalories := ElfCaloriesTopThree new.
	elfCalories input: self sampleInput.
	self assert: elfCalories compute equals: 45000.
]
