"
AoC 2022 - Day 8 part 2

"
Class {
	#name : 'ScenicScore',
	#superclass : 'TreeVisibility',
	#category : 'AdventOfCode-AoC2022',
	#package : 'AdventOfCode',
	#tag : 'AoC2022'
}

{ #category : 'api actions' }
ScenicScore >> compute [
	|lines|
	lines := self input substrings.
	self initializeGridFrom: lines.
	self fillGridFrom: lines.
	self setScenicScoresInGrid.
	^ self highestScenicScore 
]

{ #category : 'private' }
ScenicScore >> distanceBottomFrom: aPosition treeHeight: treeHeight [

	|resultIndex|
	resultIndex := ((aPosition x + 1) to: self grid rowCount) detect: [:rowIdx | 
		|neighbour|
		neighbour := (self grid at: rowIdx at: aPosition y) height.
		neighbour >= treeHeight 
	] ifNone: [ self grid rowCount ].
	^  resultIndex - (aPosition x)
]

{ #category : 'private' }
ScenicScore >> distanceLeftFrom: aPosition treeHeight: treeHeight [

	|resultIndex|
	resultIndex := ((aPosition y - 1) to: 1 by: -1) detect: [:colIdx | 
		|neighbour|
		neighbour := (self grid at: aPosition x at: colIdx) height.
		neighbour >= treeHeight 
	] ifNone: [ 1 ].
	^ aPosition y - resultIndex
]

{ #category : 'private' }
ScenicScore >> distanceRightFrom: aPosition treeHeight: treeHeight [

	|resultIndex|
	resultIndex := ((aPosition y + 1) to: self grid columnCount) detect: [:colIdx | 
		|neighbour|
		neighbour := (self grid at: aPosition x at: colIdx) height.
		neighbour >= treeHeight 
	] ifNone: [ self grid columnCount ].
	^ resultIndex - (aPosition y)
]

{ #category : 'private' }
ScenicScore >> distanceTopFrom: aPosition treeHeight: treeHeight [

	|resultIndex|
	resultIndex := ((aPosition x - 1) to: 1 by: -1) detect: [:rowIdx | 
		|neighbour|
		neighbour := (self grid at: rowIdx at: aPosition y) height.
		neighbour >= treeHeight 
	] ifNone: [ 1 ].
	^ aPosition x - resultIndex
]

{ #category : 'api actions' }
ScenicScore >> highestScenicScore [
	
	^ self grid maxValue: #scenicScore
]

{ #category : 'private' }
ScenicScore >> scenicScoreAt: aPosition [

	|treeHeight result|
	treeHeight := (self grid at: aPosition x at: aPosition y) height.


	result := self distanceLeftFrom: aPosition treeHeight: treeHeight.
	result := result * (self distanceRightFrom: aPosition treeHeight: treeHeight).
	result := result * (self distanceTopFrom: aPosition treeHeight: treeHeight).
	result := result * (self distanceBottomFrom: aPosition treeHeight: treeHeight).
	^ result 
]

{ #category : 'private' }
ScenicScore >> setScenicScoresInGrid [

	self grid indicesDo: [ :row :column |
		(self isEdgeTreeAt: row@column) ifFalse: [
			|score|
			score :=	self scenicScoreAt: row@column.
			(self grid at: row at: column) scenicScore: score.
		]
	]
]

{ #category : 'private' }
ScenicScore >> treeClass [ 

	^ ScenicTree 
]
