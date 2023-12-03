"
AoC 2022 - Day 5 part 2 - instruction to move multiple crates at once
"
Class {
	#name : 'CrateMover9001',
	#superclass : 'CrateInstruction',
	#category : 'AdventOfCode-AoC2022',
	#package : 'AdventOfCode',
	#tag : 'AoC2022'
}

{ #category : 'api actions' }
CrateMover9001 >> rearrangeOn: stackArray [
	
	|fromStack toStack intermediator|
	fromStack := stackArray at: self from.
	toStack := stackArray at: self to.
	intermediator := Stack new.
	
	self amount timesRepeat: [ 
		intermediator push: fromStack pop.		
	].
	self amount timesRepeat: [ 
		toStack push: intermediator pop	
	]
]
