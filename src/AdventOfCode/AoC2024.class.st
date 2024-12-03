"
AoC 2024 solutions
"
Class {
	#name : 'AoC2024',
	#superclass : 'AoC',
	#category : 'AdventOfCode-AoC2024',
	#package : 'AdventOfCode',
	#tag : 'AoC2024'
}

{ #category : 'executing' }
AoC2024 class >> aocSolutionClasses [
	^ 
	{LocationDistance. SimilarityScore.
	 SafeReports. SafeReportsWithDampener.
	 MultiplyNumbers.
	}
]

{ #category : 'executing' }
AoC2024 class >> solutionYearString [

	^ '2024'
]
