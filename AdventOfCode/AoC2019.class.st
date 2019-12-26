Class {
	#name : #AoC2019,
	#superclass : #AoC,
	#category : #AdventOfCode
}

{ #category : #executing }
AoC2019 class >> aocSolutionClasses [
	^ 
	{	SumOfFuel. SumOfFuelWithAddedFuel.
		RestoreIntcodeProgram. FindNounAndVerb.
		CrossedWiresIntersection. FewestStepsToIntersection.
		PasswordCombinations.
	}
]

{ #category : #executing }
AoC2019 class >> day: adventDay [
	^ Array with: (self day: adventDay part: 1)  with:  (self day: adventDay part: 2)
]

{ #category : #executing }
AoC2019 class >> day: adventDay part: partNumber [
 	|aocSolutionClass| 
	aocSolutionClass := self aocSolutionClasses 
		at: adventDay - 1 * 2 + partNumber 
		ifAbsent: [ self error: 'AoC 2019 - solution not found for day: ', (adventDay asString), ' part: ', (partNumber asString), '.'].

	^ aocSolutionClass new compute
]
