"
A TreeVisibilityTest is a test class for testing the behavior of TreeVisibility
"
Class {
	#name : #TreeVisibilityTest,
	#superclass : #TestCase,
	#category : #'AdventOfCode-Tests-AoC2022'
}

{ #category : #test }
TreeVisibilityTest >> testCompute [
	| treeHouse|
	treeHouse := TreeVisibility new.
	self assert: treeHouse compute equals: 1854.
]

{ #category : #test }
TreeVisibilityTest >> testComputeSample [
	|rows treeHouse|
	rows := '30373
25512
65332
33549
35390'.

	treeHouse := TreeVisibility new.
	treeHouse input: rows.
	self assert: treeHouse compute equals: 21.
]

{ #category : #tests }
TreeVisibilityTest >> testFillGridFrom [
	|rows treeHouse| 	
	rows := '123
456
789
000' substrings.

	treeHouse := TreeVisibility new.
	treeHouse initializeGridFrom: rows.
	treeHouse fillGridFrom: rows.
	self assert: (treeHouse grid allSatisfy: [ :each | each height isNumber ]).
	self assert: (treeHouse grid at: 1 at: 1) height equals: 1.
	self assert: (treeHouse grid at: 3 at: 3) height equals: 9.
	self assert: (treeHouse grid at: 4 at: 1) height equals: 0.
]

{ #category : #tests }
TreeVisibilityTest >> testInitializeGridFrom [
	|rows treeHouse| 	
		rows := '123
456
789
000'.


treeHouse := TreeVisibility new.
treeHouse initializeGridFrom: rows substrings.
self assert: treeHouse grid rowCount equals: 4.
self assert: treeHouse grid columnCount equals: 3.

]

{ #category : #test }
TreeVisibilityTest >> testIsEdgeTreeAt [

	|rows treeHouse| 	
	rows := '123
456
789
000'.


	treeHouse := TreeVisibility new.
	treeHouse initializeGridFrom: rows substrings.
	treeHouse grid indicesDo: [:row :column | 
		(row = 1 or: [row = treeHouse grid rowCount ]) ifTrue: [ self assert: (treeHouse isEdgeTreeAt: row@column)].
		(column = 1 or: [column = treeHouse grid columnCount ]) ifTrue: [ self assert: (treeHouse isEdgeTreeAt: row@column)].		
	].
	self deny: (treeHouse isEdgeTreeAt: 2@2).
	self deny: (treeHouse isEdgeTreeAt: 3@2).
]
