"
AoC 2021 solutions
"
Class {
	#name : #AoC2021,
	#superclass : #AoC,
	#category : #'AdventOfCode-AoC2021'
}

{ #category : #executing }
AoC2021 class >> aocSolutionClasses [
	^ 
	{	SonarSweep. SonarSweep3measures.
		Dive. DiveWithAim.
		BinaryDiagnostic.
	}
]
