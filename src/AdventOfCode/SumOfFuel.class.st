"
2019 - day 1 part 1
"
Class {
	#name : #SumOfFuel,
	#superclass : #AoC2019,
	#category : #'AdventOfCode-AoC2019'
}

{ #category : #private }
SumOfFuel >> compute [ 
	^ self input substrings sumNumbers: [ :each | 
		self fuelForMass: each asNumber
	]
]

{ #category : #private }
SumOfFuel >> fuelForMass: aMassNumber [ 
	^ (aMassNumber / 3) floor - 2
	
]
