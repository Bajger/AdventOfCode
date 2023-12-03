"
AoC 2022 - Day 8 part 1 - tree for evaluating visibility
"
Class {
	#name : 'ElfTree',
	#superclass : 'Object',
	#instVars : [
		'height',
		'isVisible'
	],
	#category : 'AdventOfCode-AoC2022',
	#package : 'AdventOfCode',
	#tag : 'AoC2022'
}

{ #category : 'instance creation' }
ElfTree class >> ofHeight: aHeight [
	
	^ self new
		height: aHeight;
		yourself 

]

{ #category : 'accessing' }
ElfTree >> height [

	^ height
]

{ #category : 'accessing' }
ElfTree >> height: anObject [

	height := anObject
]

{ #category : 'testing' }
ElfTree >> isEdgeTreeAt: aPosition on: aGrid [

	^ aPosition x = 1 or: [aPosition x = (aGrid rowCount) or: 
		[ aPosition y = 1 or: [ aPosition y = (aGrid columnCount ) ]]]
]

{ #category : 'accessing' }
ElfTree >> isVisible [

	^ isVisible
]

{ #category : 'accessing' }
ElfTree >> isVisible: anObject [

	isVisible := anObject
]
