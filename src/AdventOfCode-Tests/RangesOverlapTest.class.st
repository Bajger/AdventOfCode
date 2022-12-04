"
A RangesOverlapTest is a test class for testing the behavior of RangesOverlap
"
Class {
	#name : #RangesOverlapTest,
	#superclass : #TestCase,
	#category : #'AdventOfCode-Tests-AoC2022'
}

{ #category : #tests }
RangesOverlapTest >> testCompute [
	|overlap|
	overlap := RangesOverlap new.
	self assert: overlap compute equals: 881.
]

{ #category : #tests }
RangesOverlapTest >> testComputeSample [

	|overlap|
	overlap := RangesOverlap new.
	overlap input:'2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8'.
	self assert: overlap compute equals: 4.
]
