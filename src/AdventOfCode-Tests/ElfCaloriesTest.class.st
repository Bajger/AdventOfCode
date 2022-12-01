"
An ElfCaloriesTest is a test class for testing the behavior of ElfCalories
"
Class {
	#name : #ElfCaloriesTest,
	#superclass : #TestCase,
	#category : #'AdventOfCode-Tests-AoC2022'
}

{ #category : #tests }
ElfCaloriesTest >> sampleInput [
^ '1000
2000
3000

4000

5000
6000

7000
8000
9000

10000
'
]

{ #category : #tests }
ElfCaloriesTest >> testCompute [
	|elfCalories|
	elfCalories := ElfCalories new.
	self assert: elfCalories compute equals: 75501.
]

{ #category : #tests }
ElfCaloriesTest >> testComputeSample [
	|elfCalories|
	elfCalories := ElfCalories new.
	elfCalories input: self sampleInput.
	self assert: elfCalories compute equals: 24000.
]
