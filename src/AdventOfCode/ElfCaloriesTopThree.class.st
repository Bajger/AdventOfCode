"
AoC 2022 - Day 1 part 2
"
Class {
	#name : #ElfCaloriesTopThree,
	#superclass : #ElfCalories,
	#category : #'AdventOfCode-AoC2022'
}

{ #category : #'api actions' }
ElfCaloriesTopThree >> compute [
	
	^ ((self elvesWithSums sort: [ :a :b | a > b]) copyFrom: 1 to: 3) sum
]
