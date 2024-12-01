"
A ScenicScoreTest is a test class for testing the behavior of ScenicScore
"
Class {
	#name : 'ScenicScoreTest',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-Tests-AoC2022',
	#package : 'AdventOfCode-Tests',
	#tag : 'AoC2022'
}

{ #category : 'tests' }
ScenicScoreTest >> testCompute [
	| treeHouse |
	treeHouse := ScenicScore new.
	self assert: treeHouse compute equals: 527340.
]

{ #category : 'tests' }
ScenicScoreTest >> testComputeSample [
	|rows treeHouse|
	rows := '30373
25512
65332
33549
35390'.

	treeHouse := ScenicScore new.
	treeHouse input: rows.
	self assert: treeHouse compute equals: 8.
]
