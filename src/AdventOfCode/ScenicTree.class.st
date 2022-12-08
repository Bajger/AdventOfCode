"
AoC 2022 - Day 8 part 2 - tree for evaluating scenic score
"
Class {
	#name : #ScenicTree,
	#superclass : #ElfTree,
	#instVars : [
		'scenicScore'
	],
	#category : #'AdventOfCode-AoC2022'
}

{ #category : #initialization }
ScenicTree >> initialize [ 
	
	super initialize.
	self scenicScore: 0.
]

{ #category : #accessing }
ScenicTree >> scenicScore [

	^ scenicScore
]

{ #category : #accessing }
ScenicTree >> scenicScore: anObject [

	scenicScore := anObject
]
