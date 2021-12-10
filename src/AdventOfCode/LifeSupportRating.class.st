"
AoC 2021 - day 3 part 2
"
Class {
	#name : #LifeSupportRating,
	#superclass : #BinaryDiagnostic,
	#category : #'AdventOfCode-AoC2021'
}

{ #category : #'api actions' }
LifeSupportRating >> compute [ 
	|aNumbers bitStringSize oxygenRating co2Rating|
	aNumbers := self diagnosticNumbers.
	bitStringSize := aNumbers max highBit.
	oxygenRating := self findOxygenRatingFrom: aNumbers bitSize: bitStringSize.
	co2Rating := self findCO2RatingFrom: aNumbers bitSize: bitStringSize.
	"1 to: bitStringSize do: [:bitPos |"
]

{ #category : #'api actions' }
LifeSupportRating >> filterCandidates: aNumbers of: bitValue at: bitPosition [
	|candidates|
	aNumbers select: [:each | each bitAt: bitPosition  ]
]

{ #category : #'api actions' }
LifeSupportRating >> findOxygenRatingFrom: aNumbers bitSize: bitStringSize [
	1 to: bitStringSize do: [:bitPos |
		|candidates|
		candidates := self filterCandidatesOf: (self mostCommonBitAt: bitPos from: aNumbers whenEqual: 1) at: bitPos.
		
	]
]
