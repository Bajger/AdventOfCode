"
AoC 2024 - Day 3 part 2
"
Class {
	#name : 'EnabledMultiplications',
	#superclass : 'MultiplyNumbers',
	#instVars : [
		'enabled'
	],
	#category : 'AdventOfCode-AoC2024',
	#package : 'AdventOfCode',
	#tag : 'AoC2024'
}

{ #category : 'accessing' }
EnabledMultiplications >> enabled [

	^ enabled
]

{ #category : 'accessing' }
EnabledMultiplications >> enabled: anObject [

	enabled := anObject
]

{ #category : 'api actions' }
EnabledMultiplications >> evaluateInstruction: anInstruction [

	(anInstruction includesSubstring: 'do()') ifTrue: [ self enabled: true ].
	(anInstruction includesSubstring: 'don''t()') ifTrue: [ self enabled: false ].
	(anInstruction includesSubstring: 'mul') ifTrue: [
		self enabled ifTrue: [ ^ super evaluateInstruction: anInstruction ] 
	].
	^ 0 "zero if not processing mul instruction"

]

{ #category : 'initialization' }
EnabledMultiplications >> initialize [ 
	
	super initialize. 
	self regex: ('({1})|({2})|({3})' format: 
	{'do\(\)'. 'don''t\(\)'. super regex}).
	self enabled: true.
]
