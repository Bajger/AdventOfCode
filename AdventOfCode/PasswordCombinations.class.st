Class {
	#name : #PasswordCombinations,
	#superclass : #AoC2019,
	#instVars : [
		'evaluatedNumber',
		'currentDigitIndex'
	],
	#category : #AdventOfCode
}

{ #category : #'private-constants' }
PasswordCombinations class >> getInputString [

	^ '359282-820401'
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

{ #category : #accessing }
PasswordCombinations >> nextDigit [

	^ self evaluatedNumber decimalDigitAt: self currentDigitIndex - 1
]

{ #category : #private }
PasswordCombinations >> numberMeetsPasswordCriteria [
	|adjacentAreSame|
	adjacentAreSame := false.
	self evaluatedNumber decimalDigitLength to:  2 by: -1 do: [: digitIndex |
		self currentDigitIndex: digitIndex. 
		self adjacentDigitsDecreasing ifTrue: [ ^ false ].
		adjacentAreSame := adjacentAreSame or: [ self adjacentDigitsAreSame].
	].
	^ adjacentAreSame
]
