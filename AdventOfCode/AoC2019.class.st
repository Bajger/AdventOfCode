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

{ #category : #executing }
AoC2019 class >> day2 [
	^ Array with: self day2Part1  with: self day2Part2
]

{ #category : #executing }
AoC2019 class >> day2Part1 [
	^ RestoreIntcodeProgram new compute
]

{ #category : #executing }
AoC2019 class >> day2Part2 [
	^ FindNounAndVerb new compute
]

{ #category : #executing }
AoC2019 class >> day3 [
	^ Array with: self day3Part1  with: self day3Part2
]

{ #category : #executing }
AoC2019 class >> day3Part1 [
	^ CrossedWiresIntersection new compute
]

{ #category : #executing }
AoC2019 class >> day3Part2 [
	^ FewestStepsToIntersection new compute
]
