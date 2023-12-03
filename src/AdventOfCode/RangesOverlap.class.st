"
AoC 2022 - Day 4 part 2

"
Class {
	#name : 'RangesOverlap',
	#superclass : 'CampCleanup',
	#category : 'AdventOfCode-AoC2022',
	#package : 'AdventOfCode',
	#tag : 'AoC2022'
}

{ #category : 'api actions' }
RangesOverlap >> compute [ 

	^ self assignedSectionPairs count: [:sectionPair | sectionPair first includesAny: sectionPair second ]
]
