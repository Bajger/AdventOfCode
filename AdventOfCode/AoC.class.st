Class {
	#name : #AoC,
	#superclass : #Object,
	#instVars : [
		'input'
	],
	#category : #AdventOfCode
}

{ #category : #initialization }
AoC >> initialize [ 
	self input: self class getInputString 
	
]

{ #category : #accessing }
AoC >> input [
	^ input
]

{ #category : #accessing }
AoC >> input: anObject [
	input := anObject
]
