"
AoC 2022 - Day 8 part 1
"
Class {
	#name : #TreeVisibility,
	#superclass : #AoC2022,
	#instVars : [
		'grid'
	],
	#category : #'AdventOfCode-AoC2022'
}

{ #category : #'api actions' }
TreeVisibility >> compute [
	|lines|
	lines := self input substrings.
	self initializeGridFrom: lines.
	self fillGridFrom: lines.
	self setVisibleTreesInGrid.
	^ self countVisible 
]

{ #category : #private }
TreeVisibility >> countVisible [

	^ self grid count: #isVisible
]

{ #category : #initialization }
TreeVisibility >> fillGridFrom: inputLines [

	inputLines withIndexDo: [: line :idx| 
		self grid atRow: idx put: ( line asOrderedCollection collect: [:aChar | self treeClass ofHeight: aChar digitValue])
	]
]

{ #category : #accessing }
TreeVisibility >> grid [

	^ grid
]

{ #category : #accessing }
TreeVisibility >> grid: anObject [

	grid := anObject
]

{ #category : #initialization }
TreeVisibility >> initializeGridFrom: inputLines [

	|rowCount columnCount|
	rowCount := inputLines size.
	columnCount := inputLines first size.
	self grid: (Array2D rows: rowCount  columns: columnCount).
]

{ #category : #private }
TreeVisibility >> isEdgeTreeAt: aPosition [

	^ aPosition x = 1 or: [aPosition x = (self grid rowCount) or: 
		[ aPosition y = 1 or: [ aPosition y = (self grid columnCount ) ]]]
]

{ #category : #private }
TreeVisibility >> isInnerVisibleTreeAt: aPosition [
	|treeHeight result|
	treeHeight := (self grid at: aPosition x at: aPosition y) height.

	result := false.
	result := result or: [self visibleFromLeftAt: aPosition treeHeight: treeHeight].
	result := result or: [self visibleFromRightAt: aPosition treeHeight: treeHeight].
	result := result or: [self visibleFromTopAt: aPosition treeHeight: treeHeight].
	result := result or: [self visibleFromBottomAt: aPosition treeHeight: treeHeight].
	^ result 
]

{ #category : #private }
TreeVisibility >> setVisibleTreesInGrid [

	self grid indicesDo: [ :row :column |
		|isSeen|
		isSeen := (self isEdgeTreeAt: row@column) or: [ self isInnerVisibleTreeAt: row@column  ].
		(self grid at: row at: column) isVisible: isSeen.
	]
]

{ #category : #private }
TreeVisibility >> treeClass [

	^ ElfTree 
]

{ #category : #private }
TreeVisibility >> visibleFromBottomAt: aPosition treeHeight: aHeight [

	^ ((aPosition x + 1) to: self grid rowCount) allSatisfy: [:rowIdx | 
		|neighbour|
		neighbour := (self grid at: rowIdx at: aPosition y) height.
		neighbour < aHeight 
	]
]

{ #category : #private }
TreeVisibility >> visibleFromLeftAt: aPosition treeHeight: aHeight [

	^ ((aPosition y - 1) to: 1 by: -1) allSatisfy: [:colIdx | 
		|neighbour|
		neighbour := (self grid at: aPosition x at: colIdx) height.
		neighbour < aHeight 
	]
]

{ #category : #private }
TreeVisibility >> visibleFromRightAt: aPosition treeHeight: aHeight [

	^ ((aPosition y + 1) to: self grid columnCount) allSatisfy: [:colIdx | 
		|neighbour|
		neighbour := (self grid at: aPosition x at: colIdx) height.
		neighbour < aHeight 
	]
]

{ #category : #private }
TreeVisibility >> visibleFromTopAt: aPosition treeHeight: aHeight [

	^ ((aPosition x - 1) to: 1 by: -1) allSatisfy: [:rowIdx | 
		|neighbour|
		neighbour := (self grid at: rowIdx at: aPosition y) height.
		neighbour < aHeight 
	]
]
