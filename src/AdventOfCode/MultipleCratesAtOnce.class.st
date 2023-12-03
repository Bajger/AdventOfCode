"
AoC 2022 - Day 5 part 2
"
Class {
	#name : 'MultipleCratesAtOnce',
	#superclass : 'SupplyStacks',
	#category : 'AdventOfCode-AoC2022',
	#package : 'AdventOfCode',
	#tag : 'AoC2022'
}

{ #category : 'private' }
MultipleCratesAtOnce >> getInstructionFrom: aLine [ 
	
	^ CrateMover9001 from: aLine
]
