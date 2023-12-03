"
2019 - day 4 part 2
"
Class {
	#name : 'ExclusivePasswordCombinations',
	#superclass : 'PasswordCombinations',
	#category : 'AdventOfCode-AoC2019',
	#package : 'AdventOfCode',
	#tag : 'AoC2019'
}

{ #category : 'accessing' }
ExclusivePasswordCombinations >> adjacentAreSameExclusively [

	^ self bagOfSameDigits size = 2
]

{ #category : 'accessing' }
ExclusivePasswordCombinations >> adjacentDigitsAreSame [

	^ self adjacentAreSameExclusively
]
