Class {
	#name : #PasswordCombinations,
	#superclass : #AoC2019,
	#instVars : [
		'evaluatedNumber',
		'currentDigitIndex',
		'adjacentAlreadySame',
		'bagOfSameDigits'
	],
	#category : #'AdventOfCode-day4'
}

{ #category : #'private-constants' }
PasswordCombinations class >> getInputString [

	^ '359282-820401'
]

{ #category : #private }
PasswordCombinations >> addCurrentToBag [

	self bagOfSameDigits add: self currentDigit
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

	^ self bagOfSameDigits size > 1
]

{ #category : #private }
PasswordCombinations >> adjacentDigitsDecreasing [
	^ self bagOfSameDigits isNotEmpty
		and: [ self currentDigit < self bagOfSameDigits anyOne ]
]

{ #category : #accessing }
PasswordCombinations >> bagOfSameDigits [
	^ bagOfSameDigits
]

{ #category : #accessing }
PasswordCombinations >> bagOfSameDigits: anObject [
	bagOfSameDigits := anObject
]

{ #category : #private }
PasswordCombinations >> canAddSameToBag [
	^ self bagOfSameDigits isEmpty
		or: [ self bagOfSameDigits anyOne = self currentDigit ]
]

{ #category : #private }
PasswordCombinations >> compute [
 	^ self getPasswordInterval count: [:currentNumber |
			self evaluatedNumber: currentNumber.
			self numberMeetsPasswordCriteria
	]
]

{ #category : #private }
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

	self canAddSameToBag ifFalse: [
			self setAdjacentAlreadySame.		
			self resetBag.
	].
	self addCurrentToBag.
	self currentDigitIndex = 1 ifTrue: [ self setAdjacentAlreadySame  ].


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
PasswordCombinations >> numberMeetsPasswordCriteria [
	
	self resetAdjacentCriteria.
	self evaluatedNumber decimalDigitLength to: 1 by: -1 do: [: digitIndex |
		self currentDigitIndex: digitIndex. 
		self adjacentDigitsDecreasing ifTrue: [ ^ false ].
		self evaluateAdjacentCriteria.
	].
	^ self adjacentAlreadySame
]

{ #category : #private }
PasswordCombinations >> resetAdjacentCriteria [

	self adjacentAlreadySame: false.
	self resetBag.
	
]

{ #category : #private }
PasswordCombinations >> resetBag [

	self bagOfSameDigits: Bag new
]

{ #category : #private }
PasswordCombinations >> setAdjacentAlreadySame [
		
	self adjacentAlreadySame: (self adjacentAlreadySame or: [ self adjacentDigitsAreSame])

]
