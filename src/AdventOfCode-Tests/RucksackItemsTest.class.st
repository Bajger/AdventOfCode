"
A RucksackItemsTest is a test class for testing the behavior of RucksackItems
"
Class {
	#name : #RucksackItemsTest,
	#superclass : #TestCase,
	#category : #'AdventOfCode-Tests-AoC2022'
}

{ #category : #tests }
RucksackItemsTest >> testCompute [

	|rucksack|
	rucksack := RucksackItems new.

	self assert: rucksack compute equals: 8053.
	
]

{ #category : #tests }
RucksackItemsTest >> testComputeSample [

	|rucksack|
	rucksack := RucksackItems new.
	rucksack input: 'vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw'.
	self assert: rucksack compute equals: 157.
	
]

{ #category : #tests }
RucksackItemsTest >> testFindSharedItemIn [

	|rucksack|
	rucksack := RucksackItems new.
	self assert: (rucksack findSharedItemIn: (rucksack getCompartmentsFrom:  'vJrwpWtwJgWrhcsFMMfFFhFp')) equals: $p.
	self assert: (rucksack findSharedItemIn: (rucksack getCompartmentsFrom: 'jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL')) equals: $L.
	self assert: (rucksack findSharedItemIn: (rucksack getCompartmentsFrom:'PmmdzqPrVvPwwTWBwg')) equals: $P.
	
	
]

{ #category : #tests }
RucksackItemsTest >> testPriorityOf [

	|rucksack|
	rucksack := RucksackItems new.
	self assert: (rucksack priorityOf:  $a) equals: 1.
	self assert: (rucksack priorityOf:  $z) equals: 26.
	self assert: (rucksack priorityOf:  $A) equals: 27.
	self assert: (rucksack priorityOf:  $Z) equals: 52.
]
