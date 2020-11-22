Class {
	#name : #ExclusivePasswordCombinations,
	#superclass : #PasswordCombinations,
	#instVars : [
		'adjacentAreSameExclusively'
	],
	#category : #'AdventOfCode-AoC2019'
}

{ #category : #accessing }
ExclusivePasswordCombinations >> adjacentAreSameExclusively [
	^ adjacentAreSameExclusively
]

{ #category : #accessing }
ExclusivePasswordCombinations >> adjacentAreSameExclusively: anObject [
	adjacentAreSameExclusively := anObject
]

{ #category : #private }
ExclusivePasswordCombinations >> adjacentDigitsAreSameExclusively [
		
	^ self currentDigit = self nextDigit and: [ self nextDigit ~= self nextAfterNextDigit]
]

{ #category : #private }
ExclusivePasswordCombinations >> evaluateAdjacentCriteria [

	self setAdjacentAreSameExclusively.
]

{ #category : #private }
ExclusivePasswordCombinations >> meetsAdjacentCriteria [

	^ self adjacentAreSameExclusively
]

{ #category : #private }
ExclusivePasswordCombinations >> nextAfterNextDigit [

	"if next after next is out of bounds, return -1"
	self currentDigitIndex - 2 < 1 ifTrue: [ ^ -1 ].
	^ self evaluatedNumber decimalDigitAt: self currentDigitIndex - 2
]

{ #category : #private }
ExclusivePasswordCombinations >> resetAdjacentCriteria [
	super resetAdjacentCriteria.
	self adjacentAreSameExclusively: false.
]

{ #category : #private }
ExclusivePasswordCombinations >> setAdjacentAreSameExclusively [
		
	self adjacentDigitsAreSame and: [ self adjacentAlreadySame not]
]
