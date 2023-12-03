"
AoC 2021 - day 3 part 2
"
Class {
	#name : 'LifeSupportRating',
	#superclass : 'BinaryDiagnostic',
	#category : 'AdventOfCode-AoC2021',
	#package : 'AdventOfCode',
	#tag : 'AoC2021'
}

{ #category : 'api actions' }
LifeSupportRating >> compute [ 
	|aNumbers oxygenRating co2Rating|
	aNumbers := self diagnosticNumbers.
	oxygenRating := self findOxygenRatingFrom: aNumbers.
	co2Rating := self findCO2RatingFrom: aNumbers.
	
	^ oxygenRating * co2Rating 
]

{ #category : 'api actions' }
LifeSupportRating >> filterCandidatesFrom: candidateColl useFilter: aBitBlock at: bitPos [
	|newCandidates aBit|
	bitPos < 1 ifTrue: [ ^ self error: 'Could not find a life support candidate number.' ].
	aBit := aBitBlock value: candidateColl value: bitPos.
	newCandidates := candidateColl select: [:aNumber | (aNumber bitAt: bitPos) = aBit ].
	newCandidates size = 1 ifTrue: [ ^ newCandidates first ].
	^ self filterCandidatesFrom: newCandidates useFilter: aBitBlock at: bitPos - 1
]

{ #category : 'api actions' }
LifeSupportRating >> findCO2RatingFrom: aNumbers [

		^ self filterCandidatesFrom: aNumbers useFilter: self getCO2BitFilter at: aNumbers max highBit.
]

{ #category : 'api actions' }
LifeSupportRating >> findOxygenRatingFrom: aNumbers [

		^ self filterCandidatesFrom: aNumbers useFilter: self getOxygenBitFilter at: aNumbers max highBit.
]

{ #category : 'private' }
LifeSupportRating >> getCO2BitFilter [
	
	^ [:coll :pos | self leastCommonBitAt: pos from: coll ]
]

{ #category : 'private' }
LifeSupportRating >> getOxygenBitFilter [
	
	^ [:coll :pos | self mostCommonBitAt: pos from: coll ]
]

{ #category : 'private' }
LifeSupportRating >> leastCommonBitAt: bitPos from: aNumbers [
	|bitCount |
	"count ones in sequence of numbers at a bit position"
	bitCount := self countOfOnesIn: aNumbers  bitAt: bitPos.
	
	"when zero and one count is equal, use 0 bit value"
	((bitCount * 2) = aNumbers size) ifTrue: [ ^ 0 ].
	
	^ (bitCount < (aNumbers size / 2)) asBit
]
