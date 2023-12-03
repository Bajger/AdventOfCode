Class {
	#name : 'NodePositionChanged',
	#superclass : 'Announcement',
	#instVars : [
		'newPosition',
		'nodeIndex'
	],
	#category : 'AdventOfCode-AoC2022',
	#package : 'AdventOfCode',
	#tag : 'AoC2022'
}

{ #category : 'accessing' }
NodePositionChanged >> newPosition [

	^ newPosition
]

{ #category : 'accessing' }
NodePositionChanged >> newPosition: anObject [

	newPosition := anObject
]

{ #category : 'accessing' }
NodePositionChanged >> nodeIndex [

	^ nodeIndex
]

{ #category : 'accessing' }
NodePositionChanged >> nodeIndex: anObject [

	nodeIndex := anObject
]
