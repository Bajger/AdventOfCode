"
A SimilarityScoreTest is a test class for testing the behavior of SimilarityScore
"
Class {
	#name : 'SimilarityScoreTest',
	#superclass : 'TestCase',
	#category : 'AdventOfCode-Tests-AoC2024',
	#package : 'AdventOfCode-Tests',
	#tag : 'AoC2024'
}

{ #category : 'tests' }
SimilarityScoreTest >> testCompute [

	|solution|
	solution := SimilarityScore new.
	self assert: solution compute equals: 21070419.
	
]

{ #category : 'tests' }
SimilarityScoreTest >> testComputeSample [

	|solution|
	solution := SimilarityScore new.
	solution input: '3   4
4   3
2   5
1   3
3   9
3   3'.
	self assert: solution compute equals: 31.
	
]
