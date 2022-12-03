"
AoC 2022 solutions

"
Class {
	#name : #AoC2022,
	#superclass : #AoC,
	#category : #'AdventOfCode-AoC2022'
}

{ #category : #executing }
AoC2022 class >> aocSolutionClasses [
	^ 
	{	ElfCalories. ElfCaloriesTopThree.
		RockPaperScissors. FindAShape.
	}
]
