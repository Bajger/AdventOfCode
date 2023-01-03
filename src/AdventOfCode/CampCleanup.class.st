"
AoC 2022 - Day 4 part 1
"
Class {
	#name : #CampCleanup,
	#superclass : #AoC2022,
	#category : #'AdventOfCode-AoC2022'
}

{ #category : #private }
CampCleanup >> assignedSectionPairs [

	^ self input substrings collect: [:line | 
		|pair|
		pair := line splitOn: $,.
		Array with: (self intervalFrom: pair first) with: (self intervalFrom: pair second).
	]
	
]

{ #category : #'api actions' }
CampCleanup >> compute [ 

	^ self assignedSectionPairs count: [:sectionPair | sectionPair first mutuallyContains: sectionPair second ]
]

{ #category : #private }
CampCleanup >> intervalFrom: aString [ 
	
	|range|
	range := aString splitOn: $-.
	^ (range first asNumber) to: (range second asNumber)
	
]
