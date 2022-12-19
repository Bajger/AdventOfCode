"
AoC 2022 - Day 9 part 2
"
Class {
	#name : #RopeTailPositions,
	#superclass : #TailPositions,
	#category : #'AdventOfCode-AoC2022'
}

{ #category : #initialization }
RopeTailPositions >> initializeTail [ 

	|tailArray|
	tailArray := Array new: 9.
	tailArray atAllPut: 0@0.
	self tail: tailArray
]
