Class {
	#name : #PasswordCombinations,
	#superclass : #AoC2019,
	#instVars : [
		'evaluatedNumber',
		'currentDigitIndex',
		'adjacentAlreadySame'
	],
	#category : #'AdventOfCode-AoC2019'
}

{ #category : #'private-constants' }
PasswordCombinations class >> getInputString [

	^ '359282-820401'
]

{ #category : #accessing }
PasswordCombinations >> adjacentAlreadySame [
	^ adjacentAlreadySame
]

{ #category : #accessing }
PasswordCombinations >> adjacentAlreadySame: anObject [
	adjacentAlreadySame := anObject
]

{ #category : #private }
PasswordCombinations >> adjacentDigitsAreSame [

	^ self currentDigit = self nextDigit 
]

{ #category : #private }
PasswordCombinations >> adjacentDigitsDecreasing [

		^ self currentDigit > self nextDigit
]

{ #category : #private }
PasswordCombinations >> compute [
 	^ self getPasswordInterval count: [:currentNumber |
			self evaluatedNumber: currentNumber.
			self numberMeetsPasswordCriteria
	]
]

{ #category : #accessing }
PasswordCombinations >> currentDigit [

	^ self evaluatedNumber decimalDigitAt: self currentDigitIndex
]

{ #category : #accessing }
PasswordCombinations >> currentDigitIndex [
	^ currentDigitIndex
]

{ #category : #accessing }
PasswordCombinations >> currentDigitIndex: anObject [
	currentDigitIndex := anObject
]

{ #category : #private }
PasswordCombinations >> evaluateAdjacentCriteria [

	self setAdjacentAreSame.
]

{ #category : #accessing }
PasswordCombinations >> evaluatedNumber [
	^ evaluatedNumber
]

{ #category : #accessing }
PasswordCombinations >> evaluatedNumber: anObject [
	evaluatedNumber := anObject
]

{ #category : #private }
PasswordCombinations >> getPasswordInterval [
	|stringTuple|
	stringTuple :=  self input substrings: '-'.

	^ Interval from: stringTuple first asNumber to: stringTuple last asNumber


]

{ #category : #private }
PasswordCombinations >> meetsAdjacentCriteria [

	^ self adjacentAlreadySame
]

{ #category : #accessing }
PasswordCombinations >> nextDigit [

	^ self evaluatedNumber decimalDigitAt: self currentDigitIndex - 1
]

{ #category : #private }
PasswordCombinations >> numberMeetsPasswordCriteria [
	
	self resetAdjacentCriteria.
	self evaluatedNumber decimalDigitLength to:  2 by: -1 do: [: digitIndex |
		self currentDigitIndex: digitIndex. 
		self adjacentDigitsDecreasing ifTrue: [ ^ false ].
		self evaluateAdjacentCriteria.
	].
	^ self meetsAdjacentCriteria.
]

{ #category : #private }
PasswordCombinations >> resetAdjacentCriteria [

	self adjacentAlreadySame: false.
]

{ #category : #private }
PasswordCombinations >> setAdjacentAreSame [
		
	self adjacentAlreadySame: (self adjacentAlreadySame or: [ self adjacentDigitsAreSame])

]
