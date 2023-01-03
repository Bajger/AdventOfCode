"
AoC 2022 - Day 1 part 1
"
Class {
	#name : #ElfCalories,
	#superclass : #AoC2022,
	#category : #'AdventOfCode-AoC2022'
}

{ #category : #private }
ElfCalories >> compute [ 
	| sumOfCalories |
	sumOfCalories := self elvesWithSums.
	^ sumOfCalories at: (self elfWithMostCalories: sumOfCalories). 
]

{ #category : #private }
ElfCalories >> elfWithMostCalories: elvesWithSums [ 

	^ elvesWithSums indexOf: elvesWithSums max
]

{ #category : #private }
ElfCalories >> elvesWithCalories [
	|elves|
	elves := self input splitOn: (Array with: Character cr with: Character cr). 
	^ elves collect: [ :line | line substrings collect: #asNumber ]
]

{ #category : #private }
ElfCalories >> elvesWithSums [

	^  self elvesWithCalories collect: #sum
]
