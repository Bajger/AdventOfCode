"
2019 - day 2 part 1
"
Class {
	#name : #RestoreIntcodeProgram,
	#superclass : #AoC2019,
	#instVars : [
		'sequenceIndex',
		'intcodeProgram'
	],
	#category : #'AdventOfCode-AoC2019'
}

{ #category : #execution }
RestoreIntcodeProgram >> compute [ 
	self restoreGravityAssistProgram.
	self processOpcodesOfProgram.
	^ self intcodeProgram first

]

{ #category : #'private ' }
RestoreIntcodeProgram >> generateOpcode [

	^ OpCode on: self
]

{ #category : #'private ' }
RestoreIntcodeProgram >> goToEnd [
	self sequenceIndex: self intcodeProgram size
]

{ #category : #'private ' }
RestoreIntcodeProgram >> goToNextOpcodeFrom: previousOpcode [

	self sequenceIndex: self sequenceIndex + previousOpcode stepForNextCode
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
	
	^ self sequenceIndex >= self intcodeProgram size
]

{ #category : #'private ' }
RestoreIntcodeProgram >> processOpcode [

	|opcode |
	opcode := self generateOpcode.
	opcode doOperation.
	^ opcode 
]

{ #category : #'private ' }
RestoreIntcodeProgram >> processOpcodesOfProgram [
	self sequenceIndex: 1.
	[ | opcode |
	opcode := self processOpcode.
	opcode shouldHalt
		ifTrue: [ self goToEnd ]
		ifFalse: [ self goToNextOpcodeFrom: opcode] ]
		doWhileFalse: [ self isAtTheEnd ].
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
