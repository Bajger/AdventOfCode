"
AoC 2024 - Day 1 part 2
"
Class {
	#name : 'SimilarityScore',
	#superclass : 'LocationDistance',
	#category : 'AdventOfCode-AoC2024',
	#package : 'AdventOfCode',
	#tag : 'AoC2024'
}

{ #category : 'initialization' }
SimilarityScore >> collectSimilarityScores [

	^ self leftList collect: [: left | left * (self rightList occurrencesOf: left) ]
]

{ #category : 'initialization' }
SimilarityScore >> compute [

	self setupLists.
	^ self collectSimilarityScores sum.
]
