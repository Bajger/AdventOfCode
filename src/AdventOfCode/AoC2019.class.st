"
Summary 
I represent AdventOfCode - year 2019 solutions

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : 'AoC2019',
	#superclass : 'AoC',
	#category : 'AdventOfCode-AoC2019',
	#package : 'AdventOfCode',
	#tag : 'AoC2019'
}

{ #category : 'executing' }
AoC2019 class >> aocSolutionClasses [
	^ 
	{	SumOfFuel. SumOfFuelWithAddedFuel.
		RestoreIntcodeProgram. FindNounAndVerb.
		CrossedWiresIntersection. FewestStepsToIntersection.
		PasswordCombinations. ExclusivePasswordCombinations.
		TESTDiagnostic. TESTDiagnosticThermalRadiators.
		UniversalOrbitMap. OrbitalTransfers.
		AmplificationCircuit.
	}
]

{ #category : 'executing' }
AoC2019 class >> solutionYearString [

	^ '2019'
]
