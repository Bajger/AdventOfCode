"
2019 - day 1 part 2
"
Class {
	#name : #SumOfFuelWithAddedFuel,
	#superclass : #SumOfFuel,
	#category : #'AdventOfCode-AoC2019'
}

{ #category : #private }
SumOfFuelWithAddedFuel >> fuelForMass: aNumber [
	|aFuel|
	aFuel := super fuelForMass: aNumber.
	aFuel < 0 ifTrue: [^ 0].
	^ aFuel + (self fuelForMass: aFuel)
]
