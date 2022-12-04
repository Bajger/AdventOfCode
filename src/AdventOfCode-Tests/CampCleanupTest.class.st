"
A CampCleanupTest is a test class for testing the behavior of CampCleanup
"
Class {
	#name : #CampCleanupTest,
	#superclass : #TestCase,
	#category : #'AdventOfCode-Tests-AoC2022'
}

{ #category : #test }
CampCleanupTest >> testAssignedSectionPairs [

	|cleanup|
	cleanup := CampCleanup new.
	cleanup input:'2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8'.
	self assert: cleanup assignedSectionPairs anyOne first isInterval.
	self assert: cleanup assignedSectionPairs anyOne second isInterval.
]

{ #category : #test }
CampCleanupTest >> testCompute [

	|cleanup|
	cleanup := CampCleanup new.
	self assert: cleanup compute equals: 528.
]

{ #category : #test }
CampCleanupTest >> testComputeSample [

	|cleanup|
	cleanup := CampCleanup new.
	cleanup input:'2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8'.
	self assert: cleanup compute equals: 2.
]

{ #category : #test }
CampCleanupTest >> testIntervalFrom [

	|cleanup|
	cleanup := CampCleanup new.
	self assert: (cleanup intervalFrom: '2-4') isInterval.
	self assert: (cleanup intervalFrom: '99-99') isInterval.
]

{ #category : #tests }
CampCleanupTest >> testmutuallyContains [

	self assert: ((2 to: 8) mutuallyContains: (3 to: 7)).
	self assert: ((6 to: 6) mutuallyContains: (4 to: 6)).
]
