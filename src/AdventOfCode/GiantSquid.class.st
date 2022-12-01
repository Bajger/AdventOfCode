"
AoC2021 - Day 4 part 1
"
Class {
	#name : #GiantSquid,
	#superclass : #AoC2021,
	#instVars : [
		'boards',
		'callNumbers'
	],
	#category : #'AdventOfCode-AoC2021'
}

{ #category : #'private ' }
GiantSquid >> addBoardFrom: aStringOfNumbers [

	|numbers aBoard aNumbers |
	aNumbers := aStringOfNumbers substrings collect: #asNumber.
	aBoard := BingoBoard new.
	1 to: 5 do: [:aRow |
		1 to: 5 do: [:aColumn |
			aBoard rowAt: aRow columnAt: aColumn put: (aNumbers at: aColumn + (aRow - 1 * 5)).		
		 ]	
	].
	self boards add: aBoard.
	

	
]

{ #category : #accessing }
GiantSquid >> boards [

	^ boards
]

{ #category : #accessing }
GiantSquid >> boards: anObject [

	boards := anObject
]

{ #category : #accessing }
GiantSquid >> callNumbers [

	^ callNumbers
]

{ #category : #accessing }
GiantSquid >> callNumbers: anObject [

	callNumbers := anObject
]

{ #category : #'api actions' }
GiantSquid >> compute [

	self parseInput.
	callNumbers do: [:callNumber |
		self boards do: [:aBoard | aBoard markNumber: callNumber.
			aBoard isWinner ifTrue: [^ aBoard winningScore  ]
		]	
	].
	
	self error: 'Could not find a winning board'.
]

{ #category : #initialize }
GiantSquid >> initialize [ 
	super initialize.
	self boards: OrderedCollection new.
	

]

{ #category : #'private ' }
GiantSquid >> parseCallNumbersFrom: aStringOfNumbers [

	self callNumbers: ((aStringOfNumbers splitOn: $,) collect: #asNumber)	
]

{ #category : #'private ' }
GiantSquid >> parseInput [
	|inputArrays|
	inputArrays := self input splitOn: (Array with: Character cr with: Character cr).
	self parseCallNumbersFrom: inputArrays first.
	2 to: inputArrays size do: [:aStringOfNumbers |
		self addBoardFrom: aStringOfNumbers.
	].
]
