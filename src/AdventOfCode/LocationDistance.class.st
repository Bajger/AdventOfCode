"
AoC 2024 - Day 1 part 1
"
Class {
	#name : 'LocationDistance',
	#superclass : 'AoC2024',
	#instVars : [
		'leftList',
		'rightList'
	],
	#category : 'AdventOfCode-AoC2024',
	#package : 'AdventOfCode',
	#tag : 'AoC2024'
}

{ #category : 'initialization' }
LocationDistance >> collectDistances [

	^ self leftList with: self rightList collect: [:leftNr :rightNr |
		(leftNr - rightNr) abs.
	]
]

{ #category : 'initialization' }
LocationDistance >> compute [

	self setupLists.
	^ self collectDistances sum.
]

{ #category : 'initialization' }
LocationDistance >> initialize [ 

	super initialize. 
	self leftList: SortedCollection new.
	self rightList: SortedCollection new.
	
]

{ #category : 'accessing' }
LocationDistance >> leftList [

	^ leftList
]

{ #category : 'accessing' }
LocationDistance >> leftList: anObject [

	leftList := anObject
]

{ #category : 'accessing' }
LocationDistance >> rightList [

	^ rightList
]

{ #category : 'accessing' }
LocationDistance >> rightList: anObject [

	rightList := anObject
]

{ #category : 'initialization' }
LocationDistance >> setupLists [

	self input substrings pairsDo: [:left :right | 
		self leftList add: left asNumber.
		self rightList add: right asNumber.
	].

]
