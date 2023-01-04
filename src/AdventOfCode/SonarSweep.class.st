"
AoC 2021 - day 1 part 1
"
Class {
	#name : #SonarSweep,
	#superclass : #AoC2021,
	#category : #'AdventOfCode-AoC2021'
}

{ #category : #'api actions' }
SonarSweep >> compute [ 
	^ (self getSonarData overlappingPairsCollect: [ :fst :snd |
		fst < snd  
		]) count: #value
]

{ #category : #'private ' }
SonarSweep >> getSonarData [

	^ self input substrings collect: #asNumber
]
