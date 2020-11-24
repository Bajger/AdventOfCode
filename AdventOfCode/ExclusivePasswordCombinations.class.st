Class {
	#name : #ExclusivePasswordCombinations,
	#superclass : #PasswordCombinations,
	#category : #'AdventOfCode-AoC2019'
}

{ #category : #accessing }
ExclusivePasswordCombinations >> adjacentAreSameExclusively [

	^ self bagOfSameDigits size = 2
]

{ #category : #accessing }
ExclusivePasswordCombinations >> adjacentDigitsAreSame [

	^ self adjacentAreSameExclusively
]
