"
AoC2021 - day 4 part 1 - class for board functionality
"
Class {
	#name : #BingoBoard,
	#superclass : #Object,
	#instVars : [
		'matrix',
		'winningScore'
	],
	#category : #'AdventOfCode-AoC2021'
}

{ #category : #actions }
BingoBoard >> assignWinningScore: aNumber [

	self winningScore: (self matrix select: [:assoc | assoc value not] thenCollect: [:assoc | assoc key ]) sum * aNumber
]

{ #category : #initialize }
BingoBoard >> initialize [ 
	super initialize.
	self matrix: (Array2D new: 5 element: (0->false)).
	self winningScore: 0.
	
]

{ #category : #private }
BingoBoard >> isAllMarkedAtColumn: aRow [

	^ (self matrix atColumn: aRow) allSatisfy: [:assoc | assoc value]
]

{ #category : #private }
BingoBoard >> isAllMarkedAtRow: aRow [

	^ (self matrix atRow: aRow) allSatisfy: [:assoc | assoc value]
]

{ #category : #accessing }
BingoBoard >> isWinner [

	^ self winningScore isZero not
]

{ #category : #actions }
BingoBoard >> markNumber: aNumber [

	self matrix withIndicesDo: [:assoc :aRow :aColumn |
		assoc key = aNumber ifTrue: [ 
			assoc value: true.
		 ].
		(self isAllMarkedAtRow: aRow) ifTrue: [ self assignWinningScore: aNumber].
		(self isAllMarkedAtColumn: aColumn) ifTrue: [ self assignWinningScore: aNumber].
	 ]
]

{ #category : #accessing }
BingoBoard >> matrix [

	^ matrix
]

{ #category : #accessing }
BingoBoard >> matrix: anObject [

	matrix := anObject
]

{ #category : #accessing }
BingoBoard >> rowAt: aRow columnAt: aColumn put: aNumber [

	(self matrix at: aRow at: aColumn) key: aNumber
]

{ #category : #accessing }
BingoBoard >> winningScore [

	^ winningScore
]

{ #category : #accessing }
BingoBoard >> winningScore: anObject [

	winningScore := anObject
]
