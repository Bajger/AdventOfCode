"
AoC 2024 - Day 2 part 2
"
Class {
	#name : 'SafeReportsWithDampener',
	#superclass : 'SafeReports',
	#category : 'AdventOfCode-AoC2024',
	#package : 'AdventOfCode',
	#tag : 'AoC2024'
}

{ #category : 'api actions' }
SafeReportsWithDampener >> isReportSafe: arrayOfNumbers [
	
	(super isReportSafe: arrayOfNumbers) ifTrue: [ ^ true ].
	
	^ (1 to: arrayOfNumbers size) anySatisfy: [:indexOfBadLevel | 
		super isReportSafe: (arrayOfNumbers copyWithoutIndex: indexOfBadLevel) 
	]

]
