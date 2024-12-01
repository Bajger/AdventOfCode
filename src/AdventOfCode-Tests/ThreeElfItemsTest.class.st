"
A ThreeElfItemsTest is a test class for testing the behavior of ThreeElfItems
"
Class {
	#name : 'ThreeElfItemsTest',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-Tests-AoC2022',
	#package : 'AdventOfCode-Tests',
	#tag : 'AoC2022'
}

{ #category : 'tests' }
ThreeElfItemsTest >> testCompute [

	|threeElves|
	threeElves := ThreeElfItems new.
	self assert: threeElves compute equals: 2425.
	
]

{ #category : 'tests' }
ThreeElfItemsTest >> testComputeSample [

	|threeElves|
	threeElves := ThreeElfItems new.
	threeElves input: 'vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw'.
	self assert: threeElves compute equals: 70.
	
]
