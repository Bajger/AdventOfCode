Class {
	#name : #RestoreIntcodeProgram,
	#superclass : #AoC2019,
	#instVars : [
		'sequenceIndex',
		'intcodeProgram'
	],
	#category : #'AdventOfCode-AoC2019'
}

{ #category : #'private-constants' }
RestoreIntcodeProgram class >> getInputString [
	^ '1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,1,10,19,1,19,5,23,2,23,6,27,1,27,5,31,2,6,31,35,1,5,35,39,2,39,9,43,1,43,5,47,1,10,47,51,1,51,6,55,1,55,10,59,1,59,6,63,2,13,63,67,1,9,67,71,2,6,71,75,1,5,75,79,1,9,79,83,2,6,83,87,1,5,87,91,2,6,91,95,2,95,9,99,1,99,6,103,1,103,13,107,2,13,107,111,2,111,10,115,1,115,6,119,1,6,119,123,2,6,123,127,1,127,5,131,2,131,6,135,1,135,2,139,1,139,9,0,99,2,14,0,0'
]

{ #category : #execution }
RestoreIntcodeProgram >> compute [ 
	self restoreGravityAssistProgram.
	self processOpcodesOfProgram.
	^ self intcodeProgram first

]

{ #category : #'private ' }
RestoreIntcodeProgram >> doOperation: opcode [

	| firstNr secondNr|
	firstNr := self intcodeProgram at: self indexOfFirstNr.
	secondNr := self intcodeProgram at: self indexOfSecondNr.
	
	opcode == 1 ifTrue: [ self intcodeProgram at: self indexOfResult put: (firstNr + secondNr)].
	opcode == 2 ifTrue: [ self intcodeProgram at: self indexOfResult put: (firstNr * secondNr)].
]

{ #category : #'private ' }
RestoreIntcodeProgram >> goToEnd [
	self sequenceIndex: self intcodeProgram size
]

{ #category : #'private ' }
RestoreIntcodeProgram >> goToNextOpcode [

	self sequenceIndex: self sequenceIndex + 4
	
]

{ #category : #'private ' }
RestoreIntcodeProgram >> indexOfFirstNr [
	
	^ self indexOfNr: 1
]

{ #category : #'private ' }
RestoreIntcodeProgram >> indexOfNr: increment [
	
	^ (self intcodeProgram at: (self sequenceIndex + increment)) + 1
	
]

{ #category : #'private ' }
RestoreIntcodeProgram >> indexOfResult [
	
	^ self indexOfNr: 3
	
]

{ #category : #'private ' }
RestoreIntcodeProgram >> indexOfSecondNr [
	
	^ self indexOfNr: 2
	
]

{ #category : #accessing }
RestoreIntcodeProgram >> intcodeProgram [
	intcodeProgram ifNil: [ self setIntcodeProgram].
	^ intcodeProgram 
]

{ #category : #accessing }
RestoreIntcodeProgram >> intcodeProgram: anObject [
	intcodeProgram := anObject
]

{ #category : #'private ' }
RestoreIntcodeProgram >> isAtTheEnd [
	
	^ self sequenceIndex > (self intcodeProgram size - 3)
]

{ #category : #'private ' }
RestoreIntcodeProgram >> processOpcode [

	|opcode |
	opcode := self intcodeProgram at: self sequenceIndex.
	(self shouldHalt: opcode) ifTrue: [ ^ self goToEnd ].
	self doOperation: opcode. 
]

{ #category : #'private ' }
RestoreIntcodeProgram >> processOpcodesOfProgram [

	self sequenceIndex: 1.
	[ self processOpcode.
	self goToNextOpcode ]
		doWhileFalse: [ self isAtTheEnd].
	^ self intcodeProgram 
]

{ #category : #'private ' }
RestoreIntcodeProgram >> restoreGravityAssistProgram [
	
	self intcodeProgram at: 2 put: 12.
	self intcodeProgram at: 3 put: 2.
]

{ #category : #accessing }
RestoreIntcodeProgram >> sequenceIndex [
	^ sequenceIndex
]

{ #category : #accessing }
RestoreIntcodeProgram >> sequenceIndex: anObject [
	sequenceIndex := anObject
]

{ #category : #'private ' }
RestoreIntcodeProgram >> setIntcodeProgram [
	
	self intcodeProgram:  ((self input substrings: ',') collect: #asNumber)
]

{ #category : #'private ' }
RestoreIntcodeProgram >> shouldHalt: opcode [
	^ opcode = 99
]
