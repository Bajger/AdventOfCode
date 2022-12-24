Class {
	#name : #AoC,
	#superclass : #Object,
	#instVars : [
		'input'
	],
	#classInstVars : [
		'announcer'
	],
	#category : #'AdventOfCode-common'
}

{ #category : #accessing }
AoC class >> announcer [
  ^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #executing }
AoC class >> aocSolutionClasses [

	self shouldNotImplement 
]

{ #category : #executing }
AoC class >> day: adventDay [
	^ Array with: (self day: adventDay part: 1)  with:  (self day: adventDay part: 2)
]

{ #category : #executing }
AoC class >> day: adventDay part: partNumber [
 	|aocSolutionClass| 
	aocSolutionClass := self aocSolutionClasses 
		at: adventDay - 1 * 2 + partNumber 
		ifAbsent: [ self error: (self name asString), ' - solution not found for day: ', (adventDay asString), ' part: ', (partNumber asString), '.'].

	^ aocSolutionClass new compute
]

{ #category : #'private-constants' }
AoC class >> getInputString [
	"empty by default"
	^ ''
]

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
