Class {
	#name : #SumOfFuelWithAddedFuel,
	#superclass : #SumOfFuel,
	#category : #'AdventOfCode-day1'
}

{ #category : #private }
SumOfFuelWithAddedFuel >> fuelForMass: aNumber [
	|aFuel|
	aFuel := super fuelForMass: aNumber.
	aFuel < 0 ifTrue: [^ 0].
	^ aFuel + (self fuelForMass: aFuel)
]
