"
AoC 2024 - Day 3 part 1
"
Class {
	#name : 'MultiplyNumbers',
	#superclass : 'AoC2024',
	#instVars : [
		'regex',
		'instructions'
	],
	#category : 'AdventOfCode-AoC2024',
	#package : 'AdventOfCode',
	#tag : 'AoC2024'
}

{ #category : 'api actions' }
MultiplyNumbers >> compute [

	self setupInstructions.
	^ self sumMultiplications
]

{ #category : 'api actions' }
MultiplyNumbers >> evaluateInstruction: anInstruction [
	
	|pair| 
	pair := (anInstruction splitOn: $,) collect: #asInteger.
	^ pair first * pair second 
	
]

{ #category : 'initialization' }
MultiplyNumbers >> initialize [ 

	super initialize. 
	self regex: 'mul\(([1-9]|[1-9][0-9]|[1-9][0-9][0-9]),([1-9]|[1-9][0-9]|[1-9][0-9][0-9])\)'.
	self instructions: OrderedCollection new.
]

{ #category : 'accessing' }
MultiplyNumbers >> instructions [

	^ instructions
]

{ #category : 'accessing' }
MultiplyNumbers >> instructions: anObject [

	instructions := anObject
]

{ #category : 'accessing' }
MultiplyNumbers >> regex [

	^ regex
]

{ #category : 'accessing' }
MultiplyNumbers >> regex: anObject [

	regex := anObject
]

{ #category : 'api actions' }
MultiplyNumbers >> setupInstructions [

	self input 
		regex: self regex 
		matchesDo: [:each | self instructions add: each ]
]

{ #category : 'api actions' }
MultiplyNumbers >> sumMultiplications [
	
	^ self instructions sumNumbers: [:instruction |
		self evaluateInstruction: instruction 
	]
]
