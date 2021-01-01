Class {
	#name : #OpCode,
	#superclass : #Object,
	#instVars : [
		'codeComputer',
		'opcode'
	],
	#category : #'AdventOfCode-AoC2019'
}

{ #category : #'instance creation' }
OpCode class >> on: aComputer [
	
	^ self new
			codeComputer: aComputer;
			yourself
]

{ #category : #accessing }
OpCode >> codeComputer [
	^ codeComputer
]

{ #category : #accessing }
OpCode >> codeComputer: anObject [
	codeComputer := anObject
]

{ #category : #'api actions' }
OpCode >> doOperation [

	self setupOpcode.
	self performOperation.
]

{ #category : #private }
OpCode >> firstParameter [

	^ self parameterAt: 1

]

{ #category : #accessing }
OpCode >> opcode [
	^ opcode
]

{ #category : #accessing }
OpCode >> opcode: aNumber [
	opcode := aNumber
]

{ #category : #private }
OpCode >> parameterAt: index [

	^ self codeComputer intcodeProgram at: (self rawValueOf: index) + 1
]

{ #category : #'api actions' }
OpCode >> performOperation [ 

	self opcode == 1 ifTrue: [ 	self storeResult: self firstParameter + self secondParameter].
	self opcode == 2 ifTrue: [ 	self storeResult: self firstParameter * self secondParameter].
]

{ #category : #private }
OpCode >> rawValueOf: aParameter [
	
	^ (self codeComputer intcodeProgram at: (self codeComputer sequenceIndex + aParameter))
	
]

{ #category : #private }
OpCode >> secondParameter [

	^ self parameterAt: 2
]

{ #category : #private }
OpCode >> setupOpcode [
	
	self opcode: (self codeComputer intcodeProgram at: self codeComputer sequenceIndex)
]

{ #category : #'api - accessing' }
OpCode >> shouldHalt [

	^ self opcode == 99
]

{ #category : #'api - accessing' }
OpCode >> stepForNextCode [
		
	^ 4
]

{ #category : #private }
OpCode >> storeResult: aResult [
	
	"3rd parameter of opcode is where result should be stored"
	 self storeResultAt: 3 put: aResult
]

{ #category : #private }
OpCode >> storeResultAt: aParameter put: aResult [
	
	 self codeComputer intcodeProgram at: (self rawValueOf: aParameter) + 1 put: aResult
]
