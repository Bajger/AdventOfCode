Class {
	#name : #AoC2019,
	#superclass : #AoC,
	#category : #AdventOfCode
}

{ #category : #executing }
AoC2019 class >> day1 [
	^ Array with: self day1Part1  with: self day1Part2 
]

{ #category : #executing }
AoC2019 class >> day1Part1 [
	^ SumOfFuel new compute
]

{ #category : #executing }
AoC2019 class >> day1Part2 [
	^ SumOfFuelWithAddedFuel new compute
]
