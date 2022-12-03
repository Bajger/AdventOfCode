"
AoC 2022 - Day 3 part 2
"
Class {
	#name : #ThreeElfItems,
	#superclass : #RucksackItems,
	#category : #'AdventOfCode-AoC2022'
}

{ #category : #'api actions' }
ThreeElfItems >> compute [
	|ruckSacks priorities |
	ruckSacks := self input substrings.
	priorities := (1 to: ruckSacks size by: 3) collect: [: index |
		|elfArray|
		elfArray := {ruckSacks at: index.	ruckSacks at: index + 1.	ruckSacks at: index + 2.}.
		self priorityOf: (self findSharedItemIn: elfArray)  
	].
	^ priorities sum
]
