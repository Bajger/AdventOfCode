"
A RockPaperScissorsTest is a test class for testing the behavior of RockPaperScissors
"
Class {
	#name : #RockPaperScissorsTest,
	#superclass : #TestCase,
	#category : #'AdventOfCode-Tests-AoC2022'
}

{ #category : #tests }
RockPaperScissorsTest >> testCompute [
	|rpc|
	rpc := RockPaperScissors new.
	self assert: rpc compute equals: 9759.
]

{ #category : #tests }
RockPaperScissorsTest >> testComputeSample [

	|rpc|
	rpc := RockPaperScissors new.
	rpc input: 
'A Y
B X
C Z'.
	self assert: rpc compute equals: 15.
]

{ #category : #tests }
RockPaperScissorsTest >> testRoundScoreForAnd [

	|rpc|
	rpc := RockPaperScissors new.
	self assert: (rpc roundScoreFor: $A and: $X) equals: 3.
	self assert: (rpc roundScoreFor: $A and: $Y) equals: 6.
	self assert: (rpc roundScoreFor: $A and: $Z) equals: 0.
	
	self assert: (rpc roundScoreFor: $B and: $X) equals: 0.
	self assert: (rpc roundScoreFor: $B and: $Y) equals: 3.
	self assert: (rpc roundScoreFor: $B and: $Z) equals: 6.
	
	self assert: (rpc roundScoreFor: $C and: $X) equals: 6.
	self assert: (rpc roundScoreFor: $C and: $Y) equals: 0.
	self assert: (rpc roundScoreFor: $C and: $Z) equals: 3.
]

{ #category : #tests }
RockPaperScissorsTest >> testSelectedShapeScore [

	|rpc|
	rpc := RockPaperScissors new.
	self assert: (rpc selectedShapeScore: $A) equals: 1.
	self assert: (rpc selectedShapeScore: $X) equals: 1.
	self assert: (rpc selectedShapeScore: $B) equals: 2.
	self assert: (rpc selectedShapeScore: $Y) equals: 2.
	self assert: (rpc selectedShapeScore: $C) equals: 3.
	self assert: (rpc selectedShapeScore: $Z) equals: 3.
]

{ #category : #tests }
RockPaperScissorsTest >> testSelectedShapes [

	|rpc|
	rpc := RockPaperScissors new.
	rpc input: 
'A Y
B X
C Z'.
	self assert: rpc selectedShapes equals: #($A $Y $B $X $C $Z).
]
